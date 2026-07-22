# Maintainer: olalbns <olalbns@gmail.com>
pkgname=hyprkeys-git
_pkgname=HyprKeys
pkgver=r5.gd632813
pkgrel=1
pkgdesc='GTK explorer and editor for Hyprland keyboard shortcuts'
arch=('any')
url='https://github.com/olalbns/HyprKeys'
license=('MIT')
depends=('python' 'python-gobject' 'gtk4')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
provides=('hyprkeys')
conflicts=('hyprkeys')
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf 'r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pkgname}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
