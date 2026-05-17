# Maintainer: Kim DaeHyun <kernalix7@kodenet.io>
#
# This PKGBUILD is a template. The 0.5.2 / 1b0516314f21e8c81ac702b0879c1e22dc865debe2d99348dd7a184d46015217 placeholders are
# stamped by .github/workflows/aur-publish.yml on tag push (v*.*.*) before
# the file is pushed to ssh://aur@aur.archlinux.org/winpodx.git. Do not hand-
# edit the placeholders in-tree.

pkgname=winpodx
pkgver=0.5.2
pkgrel=1
pkgdesc="Windows app integration for Linux desktop (Podman/FreeRDP RemoteApp)"
arch=('any')
url="https://github.com/Kernalix7/winpodx"
license=('MIT')
# Arch's `python` is rolling and already >= 3.13, so tomllib is stdlib and
# the tomli fallback is a no-op here (marker-gated in pyproject.toml).
depends=(
  'python'
  'freerdp'
)
optdepends=(
  'podman: default container backend'
  'docker: alternative container backend'
  'libvirt: VM backend'
  'pyside6: Qt6 GUI and system tray'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-hatchling'
  'python-wheel'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/Kernalix7/winpodx/archive/v$pkgver.tar.gz")
sha256sums=('1b0516314f21e8c81ac702b0879c1e22dc865debe2d99348dd7a184d46015217')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
