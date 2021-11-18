# Maintainer: Chun Yu <junyussh@gmail.com>
pkgname=verysync
pkgver=2.11.0
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
sha256sums_i386=('017ea6e97d1acb2fefb9aa1f5a1d3194713665df1048769344640a0eea607c7d')
sha256sums_x86_64=('ad0c9a99783fb962c5a0b4096ccf1152583ac31d48573545d343719d869391bf')
sha256sums_arm=('e432998cfd3475dc1e1338a412232d37a0f0321081f834bb9b441a071660addd')
sha256sums_aarch64=('d8b0cad50d6d79a1d90aa40cbe4d5b1f422870fadd828020d91ba9ee6f700563')

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
