# Maintainer: Zhang Lei <mathcoder.zl@yandex.com>
pkgname=verysync2
pkgver=2.2.0
pkgrel=1
pkgdesc="A P2P sync tool simliar to Resilio Sync that can be used in China, syncing files via secure, distributed technology."
arch=('i386' 'x86_64' 'arm' 'aarch64')
url="https://www.verysync.com/download.html"
license=('custom')
conflicts=('verysync')
source=("verysync.service")
source_i386=("${pkgname}_i386-${pkgver}.tar.gz::https://www.verysync.com/download.php?platform=linux-386")
source_x86_64=("${pkgname}_amd64-${pkgver}.tar.gz::https://www.verysync.com/download.php?platform=linux-amd64")
source_arm=("${pkgname}_arm-${pkgver}.tar.gz::https://www.verysync.com/download.php?platform=linux-arm")
source_aarch64=("${pkgname}_arm64-${pkgver}.tar.gz::https://www.verysync.com/download.php?platform=linux-arm64")
sha256sums=('041750a8ed0877a6520991a1c222c015d586889ad46ddea992358590b0ce44f9')
sha256sums_i386=('bd9d94f96b4aebf3c95c8025fa586e2076944a1f6d22297526cd41e4b114158f')
sha256sums_x86_64=('e8c9fd3d35d3524bb38739889284f207ab3924d58dfc226e08f12b22bda00842')
sha256sums_arm=('bde99123872879966e3fe1ea52b4cedcd11c1bcd72b31310ca2d1abfef76a1c7')
sha256sums_aarch64=('f669d10d18fed7b51889c5abf46ec414531e927087b37209784d32a5a5c9d255')

package() {
	# get the verysync directory name
	dirname=$(ls -d */ | head -n 1)
	# rename the directory
	mv ${srcdir}/${dirname} "${srcdir}/verysync"
	# install main binary
  	install -D -m 755 "${srcdir}/verysync"/verysync "${pkgdir}"/usr/bin/verysync
	# install service
	install -Dm644 "${srcdir}/verysync.service" "${pkgdir}/usr/lib/systemd/system/verysync.service"
	cat << EOF
	After installation, you need to start verysync service manually.
  	WebGUI can be accessed via following URL: http://localhost:8886
EOF
}
