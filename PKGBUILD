# Maintainer: olalbns <olalbns@gmail.com>
pkgname=hyprkeys-git-bin
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
source=("hyprkeys-git-bin::git+${url}.git" 'generator')
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/hyprkeys-git-bin"
  printf 'r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  sudo "$srcdir/generator"
  cd "${srcdir}/hyprkeys-git-bin"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/hyprkeys-git-bin"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/hyprkeys-git-bin/LICENSE"
}

