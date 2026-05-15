# Maintainer: Rob Petersen <robpetersen907@gmail.com>
pkgname=archward
pkgver=0.4.2
pkgrel=1
pkgdesc="Safe-update GUI for Arch-based Linux distributions"
arch=('any')
url="https://github.com/indyfive11/archward"
license=('GPL-3.0-or-later')
depends=(
  'python>=3.11'
  'pyside6'
  'python-pydantic'
  'python-tomli-w'
  'pacman>=6.1'
  'pacman-contrib'
)
optdepends=(
  'yay: AUR helper (preferred)'
  'paru: alternative AUR helper'
  'aurutils: alternative AUR helper (best-effort)'
  'ksshaskpass: askpass for KDE/Plasma'
  'lxqt-openssh-askpass: askpass for LXQt'
  'x11-ssh-askpass: askpass for other DEs'
  'polkit: pkexec fallback'
  'meld: graphical merge tool for pacnew'
  'libnotify: desktop notifications when an update finishes'
)
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('e8c22dff013761bdf253b5c7543e918d6a7f59b928775b685522f1141f38f1bf')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 packaging/archward.desktop \
    "$pkgdir/usr/share/applications/archward.desktop"
  install -Dm644 src/archward/data/archward.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/archward.svg"
  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md \
    "$pkgdir/usr/share/doc/$pkgname/README.md"
}
