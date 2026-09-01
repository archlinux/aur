# Maintainer (Upstream): Manuel Spagnolo <shikaan@disroot.org>
# Maintainer (AUR): BlackFuffey <fluffistical@gmail.com>

# This PKGBUILD was sourced from upstream release page

# dewlock v0.1.0. Note: this tag hardcodes -Werror and ignores the
# CFLAGS from makepkg.conf; both are fixed upstream after v0.1.0.
pkgver=0.1.0
_commit=ec31d2b

pkgname=dewlock
pkgrel=1
pkgdesc="A minimal, beautiful screen locker for Wayland"
arch=('x86_64' 'aarch64')
url="https://github.com/shikaan/dewlock"
license=('MIT')
depends=('wayland' 'libxkbcommon' 'cairo' 'pam')
# wayland-scanner ships in 'wayland', which is already a runtime dependency.
makedepends=('scdoc' 'make' 'gcc')
backup=('etc/pam.d/dewlock')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e039a69eaa54c6d7438a18279d77c83af7a329ae529a8a2a992760d7f084e996')

build() {
  cd "$pkgname-$pkgver"
  make CC="gcc" VERSION="v$pkgver" SHA="$_commit" all
}

package() {
  cd "$pkgname-$pkgver"
  make install VERSION="v$pkgver" SHA="$_commit" DESTDIR="$pkgdir" PREFIX=/usr
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
