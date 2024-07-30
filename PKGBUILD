# Maintainer: atomicfs <https://aur.archlinux.org/account/atomicfs>

pkgname=python-ipware
pkgver=3.0.0
pkgrel=4
pkgdesc="Returns the best matched IP address from a given HTTP(s) header in Python"
arch=('any')
url="https://github.com/un33k/python-ipware"
license=('MIT')
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
conflicts=(
  'python-django-ipware'
)
source=("${pkgname}::git+${url}#tag=v${pkgver}")
sha256sums=('SKIP')

check() {
  cd "${srcdir}/${pkgname}"
  ./test.sh
}

build() {
  cd "${srcdir}/${pkgname}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${pkgname}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
