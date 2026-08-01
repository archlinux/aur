# Maintainer: olalbns <olalbns@gmail.com>
pkgname=hyprclip-git-bin
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
source=("hyprclip-git-bin::git+${url}.git" 'migrator')
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/hyprclip-git-bin"
  printf 'r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  sudo "$srcdir/migrator"
  cd "${srcdir}/hyprclip-git-bin"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/hyprclip-git-bin"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/hyprclip-git-bin/LICENSE"
}

