# packager: teraflops <cprieto.ortiz@gmail.com>
pkgname=python-pyicloud-git
pkgver=r55.d48e9d1
pkgrel=1
pkgdesc="A Python + iCloud wrapper to access iPhone and Calendar data"
arch=('any')
url="https://github.com/TanyaBlanc/pyicloud.git"
license=('MIT')
depends=('python' 'python-requests' 'python-certifi' 'python-keyring' 'python-tzlocal' 'python-keyrings-alt' 'python-click')
makedepends=('git' 'python-setuptools')
provides=('python-pyicloud')
conflicts=('python-pyicloud')
source=("${pkgname}::git+https://github.com/TanyaBlanc/pyicloud.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${pkgname}"
}

build() {
  cd "${srcdir}/${pkgname}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}"
  python setup.py install --root="${pkgdir}" --optimize=1
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:

