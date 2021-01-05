# Maintainer: Manuel Coenen <manuel.coenen@gmail.com>
pkgname=duetwebserver-bin
pkgver=3.2.0
pkgrel=1
pkgdesc="Optional web server for Duet 3 series"
arch=('armv7h' 'aarch64')
url="https://github.com/Duet3D/DuetSoftwareFramework.git"
license=('GPL3')
provides=("duetwebserver=${pkgver}")
conflicts=("duetwebserver")
depends=("duetcontrolserver>=${pkgver}" "duetruntime>=${pkgver}")
optdepends=('duetwebcontrol' 'duetsd')
options=(!strip staticlibs)
install="${pkgname}.install"
backup=('opt/dsf/conf/http.json')
source_armv7h=("https://pkg.duet3d.com/dists/stable/armv7/binary-armhf/duetwebserver_${pkgver}_armhf.deb")
source_aarch64=("https://pkg.duet3d.com/dists/stable/armv7/binary-arm64/duetwebserver_${pkgver}_arm64.deb")
md5sums_armv7h=('c1cec2b49a7764349d1a8c1fa8faf71a')
md5sums_aarch64=('b1adfa96348d7850454ae405247711ff')
sha1sums_armv7h=('cf378db906ae492801af681829819018b4060765')
sha1sums_aarch64=('21280a753dbe64bfd671949e47a8983804f8318c')
sha256sums_armv7h=('c7b2d6171a1e2b86859825ed85b2e122128a73a4ef6c9bd4faa8886c3a03e322')
sha256sums_aarch64=('2a4cb7483324baf46394dcdddcdd6bfd619b05fcee2edbd4f6912968e2c53588')
sha512sums_armv7h=('64695c0f53cc98f30ec24f3a8b77714d8895a7b79d38da13d7a71d7fe96073f238b63fed0df111ba61a8d144514ee14efcfa96401f387d9f270927374dd41a19')
sha512sums_aarch64=('6604c046ca0418996787fb4e6ffaeb36cda6e2cf53400c04cbf27ccff407577db9c6faced49a86f8ffa7f99f4d3d29969ff53969cbdd10b5fa7bce6b0ba4646a')

prepare() {
    tar -xf data.tar.xz
}

package() {
	install -dm 755 "${pkgdir}"/{opt/dsf/bin,opt/dsf/conf,usr/bin,usr/lib/systemd/system}
	install "${srcdir}/opt/dsf/bin/"* "${pkgdir}/opt/dsf/bin"
	ln -s "/opt/dsf/bin/DuetWebServer" "${pkgdir}/usr/bin/"
	install -m 644 "${srcdir}/usr/lib/systemd/system/"* "${pkgdir}/usr/lib/systemd/system"
	install -m 644 -o dsf -g dsf "${srcdir}/opt/dsf/conf/"* "${pkgdir}/opt/dsf/conf"
}
