# Maintainer: Manuel Coenen <manuel.coenen@gmail.com>
pkgname=duetcontrolserver-bin
pkgver=1.2.3.0
pkgrel=2
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
md5sums_armv7h=('f8ebde979f8c6c423c4f78470dc43b2f')
md5sums_aarch64=('201366074f0ff7c0f09891f11c569e80')
sha1sums_armv7h=('67d0dd82437e7b8e2bc25c9bd6fe9e4f7847f636')
sha1sums_aarch64=('64263d9c03419c99b388d44f2d8348afa62588d0')
sha256sums_armv7h=('36c136301a09b2c586d2aaebc8c3b1e3b35899d247f6c7e012d7d4af01fd3fc0')
sha256sums_aarch64=('565f744c6cd3f466b78d883988b6f43426e81a007b74a8510beb5e42e0c35083')
sha512sums_armv7h=('648d9516f30fac0fb45f46c1cf7cf56ced27f39370970257bb3c62257216701879a746925d81e78d3685f8418854133d11d5f8fb3b4adf695f040ef1329d5683')
sha512sums_aarch64=('3454fa357b827857294bea731f822fde7882b0a10fb2e7dba0aba4b12d4299b56d072c272bcf575e11a8c3140ecf3c6bfea0a8104bab6d511e1928e689f5fce3')

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
