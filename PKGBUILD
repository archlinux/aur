# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Maintainer: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Hugo Doria <hugodoria at gmail.com>

pkgname=translate-toolkit
pkgver=3.10.0
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
sha256sums=('e4bd3490004083c7f88b45e3446c8eaa0c4cdc10de0c15e610ab2a5f3bb90069')

package() {
  cd translate-$pkgver

  # FS#70224 to fix reproducible build
  export PYTHONHASHSEED=0

  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  python -s setup.py install --root="${pkgdir}" --optimize=1
  python -m compileall "${pkgdir}"/${_site-packages}/translate
}
