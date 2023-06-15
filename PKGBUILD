# Maintainer: Chun Yu <junyussh@gmail.com>
pkgname=verysync
pkgver=2.17.0
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
sha256sums_i386=('1c5b3d8bb79dcda9f2688f4b431a5e2a2aa3898ad399a09f6901a68dc545c104')
sha256sums_x86_64=('ccd1c64e6f3bb96a71870b6881b391dc4b02f929180f2874856dfe588da21f14')
sha256sums_arm=('c3b7225594f09023c03ad8ded788c49c5ef0757cc4aaf50677a9c335da4f1512')
sha256sums_aarch64=('f4461b26fd4bd56043b1bbb8c3156265bad41a1c53ab3853eb18b241657c5532')

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
