# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Maintainer: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Hugo Doria <hugodoria at gmail.com>

pkgname=translate-toolkit
pkgver=3.11.1
pkgrel=1
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
sha256sums=('bcdfd868560d902630338e5b76e9f46c8cefb0d40464aa386f298b285d464f5f')

package() {
  cd translate-$pkgver

  # FS#70224 to fix reproducible build
  export PYTHONHASHSEED=0

  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  python -s setup.py install --root="${pkgdir}" --optimize=1
  python -m compileall "${pkgdir}"/${_site-packages}/translate
}
