# Maintainer: Vlad Glagolev <scm(at)vaygr(dot)net>

pkgname=autotype
_commit=f5b6527
_pkgver=1.0.0
pkgver=1.0.0.r6.f5b6527
pkgrel=1
pkgdesc="Unicode-friendly tool for faking key presses to type strings on X11"
arch=('any')
url="https://github.com/gemdude46/autotype"
license=('MIT')
depends=('python' 'python-xlib')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("${pkgname}-${_pkgver}::git+https://github.com/gemdude46/autotype#commit=${_commit}")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}-${_pkgver}"

  printf "${_pkgver}.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${pkgname}-${_pkgver}"

  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}-${_pkgver}"

  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm755 app/autotype "${pkgdir}/usr/bin/autotype"
}
