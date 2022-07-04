# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Maintainer: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Hugo Doria <hugodoria at gmail.com>

pkgname=translate-toolkit
pkgver=3.7.1
pkgrel=1
pkgdesc="A toolkit to convert between various different translation formats, help process and validate localisations"
arch=('any')
url="https://toolkit.translatehouse.org/"
license=('GPL')
depends=('bash' 'python-lxml' 'python-six' 'python-diff-match-patch' 'python-ruamel-yaml')
makedepends=('python-setuptools')
optdepends=('gaupol: for po2sub'
            'python-chardet: encoding detector'
            'python-levenshtein: faster matching'
            'python-cheroot: for TM Server')
source=($pkgname-$pkgver.tar.gz::https://github.com/translate/translate/archive/$pkgver.tar.gz)
sha256sums=('f94cfbd62c31dbedaac5202191c9581637688b1fe5a2a5266ca3f0dbddd5f1af')

package() {
  cd "${srcdir}"/translate-$pkgver

#FS#70224 to fix reproducible building
  export PYTHONHASHSEED=0

  python -s setup.py install --root="${pkgdir}" --optimize=1
  python -m compileall "${pkgdir}"/usr/lib/python3.10/site-packages/translate
}
