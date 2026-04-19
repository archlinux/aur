pkgname=profile-sync-daemon-openrc-git
pkgver=r1.f853d1e
pkgrel=1
pkgdesc="OpenRC user service for profile-sync-daemon"
arch=('any')
url="https://github.com/haturatu/profile-sync-daemon-openrc"
license=('custom:none')
depends=('bash' 'openrc' 'profile-sync-daemon')
makedepends=('git')
provides=('profile-sync-daemon-openrc')
conflicts=('profile-sync-daemon-openrc')
backup=('etc/user/init.d/psd')
source=('git+https://github.com/haturatu/profile-sync-daemon-openrc.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/profile-sync-daemon-openrc"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  cd "$srcdir/profile-sync-daemon-openrc"

  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

  sed 's|^: "${PSD_BIN:=/bin/psd}"|: "${PSD_BIN:=/usr/bin/psd}"|' \
    psd > "$srcdir/psd.arch"
  install -Dm755 "$srcdir/psd.arch" "$pkgdir/etc/user/init.d/psd"
}
