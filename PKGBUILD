# Maintainer: graysky <graysky AT archlinux DOT us>

pkgname='anything-sync-daemon'
pkgver=5.80
pkgrel=1
pkgdesc='Offload anything to RAM (tmpfs) for speed and wear reduction.'
arch=('any')
url='https://github.com/graysky2/anything-sync-daemon'
license=('MIT')
depends=('procps-ng' 'rsync')
optdepends=('bash-completion: for tab completions under bash')
conflicts=('monitorix-sync-daemon' 'user-profile-sync-daemon' 'goanysync' 'goanysync-git' 'tmpfs-store' 'tmpfs-sync')
source=("http://repo-ck.com/source/$pkgname/$pkgname-$pkgver.tar.xz")
backup=('etc/asd.conf')
install=asd.install
sha256sums=('6cf9dc62f86fcbf113c97899e6ebac2ce7f12214993016371d7e74b4b34f62ed')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install-systemd-all
  install -Dm644 MIT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
