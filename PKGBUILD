# Maintainer: Manuel Coenen <manuel.coenen@gmail.com>
pkgname=duetcontrolserver-bin
pkgver=1.2.4.0
pkgrel=1
pkgdesc="Control server application for Duet 3 series"
arch=('armv7h' 'aarch64')
url="https://github.com/chrishamm/DuetSoftwareFramework.git"
license=('GPL3')
provides=("duetcontrolserver=${pkgver}")
conflicts=("duetcontrolserver")
depends=("duetruntime>=${pkgver}" 'linux>=4.8')
options=(!strip staticlibs)
backup=('opt/dsf/conf/config.json')
source_armv7h=("https://pkg.duet3d.com/dists/stable/armv7/binary-armhf/duetcontrolserver_${pkgver}_armhf.deb")
source_aarch64=("https://pkg.duet3d.com/dists/stable/armv7/binary-arm64/duetcontrolserver_${pkgver}_arm64.deb")
md5sums_armv7h=('6ae23046ccf0654afd57c774da4c4503')
md5sums_aarch64=('0f1bafc110a5b4eecc6f9baea7664609')
sha1sums_armv7h=('3390dd7f0ced73679028a1c0dbd2f4dda86c3e2e')
sha1sums_aarch64=('30849497aecf022ca037fdc9864bae58d4e7601d')
sha256sums_armv7h=('69b4e7801e8c5156d62837b40e9587cd6850a54698ea9288751a590ef0b9f956')
sha256sums_aarch64=('e842a71c841f45124254f6b8354d9f8d1d265764b9a4491191d5a5b75e8d6839')
sha512sums_armv7h=('4864c90fc3113ba4211241bdf5da8e6987cbf3e00c335b3bd8f57a0fcdb6e2a072c4c4f760814fb870df5ab1996c270f7a097f491faf2e61df89fbfc4d9bfbc3')
sha512sums_aarch64=('3e89805373dce8c31baa1374bbdcaae1ad46cacb8851ab42d9b1f6d9311e090cf77123222a3d92958b9096d3f67b595b5ba4a92e49e64d26004943fc1a3cd35f')

prepare() {
    tar -xf data.tar.xz
}

package() {

	# DuetControlServer, DuetWebServer, CodeConsole, CodeLogger
	install -dm 755 "${pkgdir}"/{opt/dsf/bin,opt/dsf/conf,usr/bin,usr/lib/systemd/system}
	install "${srcdir}/opt/dsf/bin/"* "${pkgdir}/opt/dsf/bin"
	install "${srcdir}/usr/lib/systemd/system/"* "${pkgdir}/usr/lib/systemd/system"
	install "${srcdir}/opt/dsf/conf/"* "${pkgdir}/opt/dsf/conf"

	ln -s "/opt/dsf/bin/DuetControlServer" "${pkgdir}/usr/bin/"
}
