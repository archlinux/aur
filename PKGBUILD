# Maintainer: olalbns <olalbns@gmail.com>
pkgname=hyprclip-git
_pkgname=HyprClip
pkgver=r3.g44c3016
pkgrel=1
pkgdesc='GTK clipboard history manager for Hyprland and Wayland'
arch=('any')
url='https://github.com/olalbns/HyprClip'
license=('MIT')
depends=('python' 'python-gobject' 'gtk4' 'cliphist' 'wl-clipboard')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
provides=('hyprclip')
conflicts=('hyprclip')
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
