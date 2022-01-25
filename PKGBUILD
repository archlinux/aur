# Maintainer: Chun Yu <junyussh@gmail.com>
pkgname=verysync
pkgver=2.13.0
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
sha256sums_i386=('89da4fd2262815c64eba4cae3626189d0ab56c40126821bf058ccf50b1cf1805')
sha256sums_x86_64=('cfac46a1c6c81b0f820aa38d2950fdbd10c09a3f5fc411b3d1c92469bfcd4311')
sha256sums_arm=('94f0e26b27d76a4ea3ce7ef58fd905549711f36831b0ead3c45a58e1c1bdcbe6')
sha256sums_aarch64=('97f205d740380bb5c76034d3d2e08aed5320091eb907f5e9a669165fabb98b7d')

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
