# Maintainer: Chun Yu <junyussh@gmail.com>
pkgname=verysync
pkgver=2.14.0
pkgrel=1
pkgdesc="A P2P sync tool simliar to Resilio Sync that can be used in China, syncing files via secure, distributed technology."
arch=('i386' 'x86_64' 'arm' 'aarch64')
url="https://www.verysync.com/download.html"
license=('custom')
source=("verysync.service")
source_i386=("${pkgname}_i386-${pkgver}.tar.gz::https://www.verysync.com/download.php?platform=linux-386")
source_x86_64=("${pkgname}_amd64-${pkgver}.tar.gz::https://www.verysync.com/download.php?platform=linux-amd64")
source_arm=("${pkgname}_arm-${pkgver}.tar.gz::https://www.verysync.com/download.php?platform=linux-arm")
source_aarch64=("${pkgname}_arm64-${pkgver}.tar.gz::https://www.verysync.com/download.php?platform=linux-arm64")
sha256sums=('041750a8ed0877a6520991a1c222c015d586889ad46ddea992358590b0ce44f9')
sha256sums_i386=('d84b71cc7ef0db95bf0f6dc3d38884b3856cc36ae1ac1f430c35cdd033cc7c16')
sha256sums_x86_64=('6214cd485bfc40a8c53a3c53e900a0fa2e629d5137345f3ad2195bd9e0f47fba')
sha256sums_arm=('6eb2a8e41dcdaacfecc20c13ef6b7805176dad6a410d38bf65a962bc0f7f8554')
sha256sums_aarch64=('113b1098434c9657e51d95a86f70436ff55db291cca1094bc65e911642424367')

package() {
	# get the verysync directory name
	dirname=$(ls -d */ | head -n 1)
	# rename the directory
	mv ${srcdir}/${dirname} "${srcdir}/verysync"
	# install main binary
  	install -D -m 755 "${srcdir}/verysync"/verysync "${pkgdir}"/usr/bin/verysync
	# install service
	install -Dm644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
	cat << EOF
	After installation, you need to start verysync service manually.
  	WebGUI can be accessed via following URL: http://localhost:8886
EOF
}
