# Maintainer: wansing <mail at wansing dot org>
pkgname=traggo-bin
pkgver=0.3.0
pkgrel=5
pkgdesc="self-hosted tag-based time tracking"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/traggo/server"
license=('GPL')
depends=('glibc' 'sqlite')
backup=('etc/traggo/server.ini')
source=(
	"server.ini"
	"traggo.service"
	"traggo.sysusers"
	"traggo.tmpfiles"
)
source_x86_64=("${url}/releases/download/v${pkgver}/traggo-server-${pkgver}-linux-amd64.zip")
source_aarch64=("${url}/releases/download/v${pkgver}/traggo-server-${pkgver}-linux-arm64.zip")
source_armv7h=("${url}/releases/download/v${pkgver}/traggo-server-${pkgver}-linux-arm-7.zip")

sha256sums=('b6eeb163ecee75c7a956c3819c82abc049f3671f78941ee1166d366fd84641b0'
            '9553563de83ea251af917f9b20a8083296641ae9289aab4755f464e020764f32'
            '149b7165c6b6a2d47a3b124bafcc216b34248326c356ff59c05112afed14c90b'
            '9a2ef73c7c151b15b2ec04962ca8a3b37e99aaa9311ed6c165409245d506a557')
sha256sums_x86_64=('bde681e8aa60327799c2078649d8646e1d3c1c9d35d34430fd52ce04e419106c')
sha256sums_aarch64=('7430f4540d4f4428be71fc6bde1a7665f652b503f40c47b781fda920ed8437fa')
sha256sums_armv7h=('420a1c7e091fcdea86c9c3ff5aebc294875b9a4db7199739caf85339ba655052')

package() {
  case "$CARCH" in
   "x86_64") _binary="amd64";;
   "aarch64") _binary="arm64";;
   "armv7h") _binary="arm-7";;
   *) echo "Unsupported architecture" && exit 1;;
  esac
  install -Dm755 traggo-server-${pkgver}-linux-${_binary} "$pkgdir"/usr/bin/traggo-server
  install -Dm644 "server.ini"      "${pkgdir}/etc/traggo/server.ini"
  install -Dm644 "traggo.service"  "${pkgdir}/usr/lib/systemd/system/traggo.service"
  install -Dm644 "traggo.sysusers" "${pkgdir}/usr/lib/sysusers.d/traggo.conf"
  install -Dm644 "traggo.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/traggo.conf"
}
