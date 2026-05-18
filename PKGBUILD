# Maintainer: indyfive11 <203553604+indyfive11@users.noreply.github.com>
pkgname=archward
pkgver=0.4.9
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
sha256sums=('2866af922315e4eca65700832a9d1835e2d58095bc4713f0990ce6e9b7adf091')

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
  install -Dm644 man/archward.1 \
    "$pkgdir/usr/share/man/man1/archward.1"
  install -Dm644 docs/cli.md \
    "$pkgdir/usr/share/doc/$pkgname/cli.md"
  install -Dm644 docs/recovery.md \
    "$pkgdir/usr/share/doc/$pkgname/recovery.md"
  install -Dm755 src/archward/data/stale_libs_scan \
    "$pkgdir/usr/share/archward/stale_libs_scan"
}
