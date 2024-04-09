_pkgname=raspotify
pkgname=raspotify-git
pkgver=0.43.56.r0.98e2ee5
pkgrel=1
pkgdesc="A spotify connect client that just works"
arch=('any')
url="https://github.com/dtcooper/raspotify"
license=('MIT')
depends=('librespot')
makedepends=('git')
backup=('etc/raspotify/conf')
source=("raspotify::git+https://github.com/dtcooper/raspotify.git"
        "raspotify.sysusers"
        "raspotify.tmpfiles")
md5sums=('SKIP'
         'bb71e0a799defd18c6b07694aa7b3658'
         '719300eb8f7d4f933c56c06a6ebaa9c1')

pkgver() {
  cd "$_pkgname"
  printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

package() {
	cd "$_pkgname"
  install -Dm644 "raspotify/lib/systemd/system/raspotify.service" "${pkgdir}/usr/lib/systemd/system/raspotify.service"
  install -Dm644 "../raspotify.sysusers" "${pkgdir}/usr/lib/sysusers.d/raspotify.conf"
  install -Dm644 "../raspotify.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/raspotify.conf"
  install -Dm644 "raspotify/etc/raspotify/conf" "${pkgdir}/etc/raspotify/conf"
}