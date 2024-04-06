# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Maintainer: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Hugo Doria <hugodoria at gmail.com>

pkgname=translate-toolkit
pkgver=3.12.2
pkgrel=2
pkgdesc="A toolkit to convert between various different translation formats, help process and validate localisations"
arch=('any')
url="https://toolkit.translatehouse.org/"
license=('GPL')
depends=('bash' 'python-lxml' 'python-ruamel-yaml')
makedepends=('python-setuptools')
optdepends=('gaupol: for po2sub'
            'python-chardet: encoding detector'
            'python-levenshtein: faster matching'
            'python-cheroot: for TM Server')
source=($pkgname-$pkgver.tar.gz::https://github.com/translate/translate/archive/$pkgver.tar.gz)
sha256sums=('c6dcfd7f9177961b38e1a06e03722aab32a91f58d9efe7638af308f249b73509')

package() {
  cd translate-$pkgver

  # FS#70224 to fix reproducible build
  export PYTHONHASHSEED=0

  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  python -s setup.py install --root="${pkgdir}" --optimize=1
  python -m compileall "${pkgdir}"/${_site-packages}/translate
}
