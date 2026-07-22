# Maintainer: olalbns <olalbns@gmail.com>
pkgname=wallshift-git
_pkgname=WallShift
pkgver=r6.gff423e3
pkgrel=1
pkgdesc='GTK4 wallpaper manager with rotation and palette exports for Hyprland'
arch=('any')
url='https://github.com/olalbns/WallShift'
license=('MIT')
depends=('python' 'python-gobject' 'gtk4' 'python-pillow')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
optdepends=(
  'awww: animated Wayland wallpaper backend (recommended)'
  'swww: animated Wayland wallpaper backend'
  'hyprpaper: Hyprland wallpaper backend'
)
provides=('wallshift')
conflicts=('wallshift')
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
