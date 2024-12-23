# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>

pkgname=i3-gnome-pomodoro
pkgver=0.1.0
pkgrel=2
pkgdesc="Integrate gnome-pomodoro into i3"
arch=('any')
url="https://github.com/kantord/i3-gnome-pomodoro"
license=('GPL-3.0-or-later')
depends=(
    'gnome-shell-pomodoro'
    'python'
    'python-click>=6.7'
    'python-gobject>=3.32.1'
    'python-i3ipc>=1.3.0'
    'python-pydbus>=0.6.0'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-poetry'
    'python-wheel'
)
optdepends=('python-blinkstick')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname//-/_}/${pkgname//-/_}-$pkgver.tar.gz")
sha256sums=('dfe372e1936576f55de3d78a7a05f22159cfa45ae712a45ebf0560ed6b92f531')

build() {
    cd ${pkgname//-/_}-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd ${pkgname//-/_}-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
