# Maintainer: Manuel Coenen <manuel.coenen@gmail.com>
pkgname=duetwebserver-bin
pkgver=3.1.0
pkgrel=1
pkgdesc="Optional web server for Duet 3 series"
arch=('armv7h' 'aarch64')
url="https://github.com/chrishamm/DuetSoftwareFramework.git"
license=('GPL3')
provides=("duetwebserver=${pkgver}")
conflicts=("duetwebserver")
depends=('duetcontrolserver>=1.2.0.0' 'duetruntime>=1.2.0.0')
optdepends=('duetwebcontrol' 'duetsd')
options=(!strip staticlibs)
backup=('opt/dsf/conf/http.json')
source_armv7h=("https://pkg.duet3d.com/dists/stable/armv7/binary-armhf/duetwebserver_${pkgver}_armhf.deb")
source_aarch64=("https://pkg.duet3d.com/dists/stable/armv7/binary-arm64/duetwebserver_${pkgver}_arm64.deb")
md5sums_armv7h=('3429e4ce54b1a052bb125408074348c9')
md5sums_aarch64=('35315f2a250a8be053067438768b2120')
sha1sums_armv7h=('586924d32be39277ddcc53ba793d86dfde8584fb')
sha1sums_aarch64=('117aa6d8e975fd0e578ce7bf9eb0efd94957760e')
sha256sums_armv7h=('7d471ab6721be14206cb1eaab772c4f6f8cfc4df415daf634bf00ff02da34841')
sha256sums_aarch64=('e192d774c45c2c365251eb110236b6ebf6354867795f32a0083c280385a4ee76')
sha512sums_armv7h=('79d483c848dbf945fd97b3edbf59f830593a3aedaf856c49ee48afd3a913f2c5ee4845a6dc2f72115afc3201580304e380219307eae8b464d521a898702bbcc4')
sha512sums_aarch64=('efd74132f4991f6cab4c00cd1ce5e36e47197355b501c2bdc144fe326974f81ea11a2c50c5197a39d04512e1b91d24795ed62a4629a94be7b88dfc26bea75354')

prepare() {
    tar -xf data.tar.xz
}

package() {
	install -dm 755 "${pkgdir}"/{opt/dsf/bin,opt/dsf/conf,usr/bin,usr/lib/systemd/system}
	install "${srcdir}/opt/dsf/bin/"* "${pkgdir}/opt/dsf/bin"
	ln -s "/opt/dsf/bin/DuetWebServer" "${pkgdir}/usr/bin/"
	install -m 644 "${srcdir}/usr/lib/systemd/system/"* "${pkgdir}/usr/lib/systemd/system"
	install -m 644 "${srcdir}/opt/dsf/conf/"* "${pkgdir}/opt/dsf/conf"
}
