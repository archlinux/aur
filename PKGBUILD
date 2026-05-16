# Maintainer: indyfive11 <203553604+indyfive11@users.noreply.github.com>
pkgname=archward
pkgver=0.4.4
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
sha256sums=('a724ee319a30b1ddfa704e1df8890a8ba12e80e15b8f5674a6f3b794e499bd7f')

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
}
