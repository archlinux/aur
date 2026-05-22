# Maintainer: 0bCdian <diegoparranava@protonmail.com>
pkgname='wal-qt'
pkgver=0.1.0
pkgrel=1
pkgdesc='Qt6 WebEngine Wayland wallpaper host driven by an HTTP control socket (ships wal-qt-host and wal-qt CLI)'
arch=('x86_64')
url='https://github.com/0bCdian/wal-qt'
license=('GPL-3.0-or-later')
depends=('qt6-webengine' 'qt6-webchannel' 'layer-shell-qt' 'pipewire' 'hicolor-icon-theme')
makedepends=('cmake' 'pkgconf' 'nodejs' 'pnpm' 'go' 'git')
provides=('wal-qt')
conflicts=('wal-qt-git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('559ea1fd692c24fcf316b2eefbed463445e62a72ea6a33201481413cf8f9e1de')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make install-system DESTDIR="$pkgdir" INSTALL_PREFIX_SYSTEM=/usr
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
