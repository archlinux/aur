# Contributor FabioLolix
# Contributor: ratata

pkgname=python-argostranslate-git
pkgver=r467.5d0d5a8
pkgrel=1
pkgdesc=" Open source neural machine translation in Python. Designed to be used either as a Python library or desktop application. Uses OpenNMT for translations and PyQt for GUI."
arch=('any')
url="https://github.com/argosopentech/argos-translate/"
license=('MIT')
depends=('python')
makedepends=(git python-setuptools)
provides=(python-argostranslate)
conflicts=(python-argostranslate)
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/argos-translate"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/argos-translate"
  python setup.py build
}

check() {
  cd "${srcdir}/argos-translate"
  python setup.py check
}

package() {
  cd "${srcdir}/argos-translate"
  python setup.py install --skip-build --optimize=1 --prefix=/usr --root="${pkgdir}"
  install -D LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
