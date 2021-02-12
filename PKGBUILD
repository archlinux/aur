# Maintainer: Manuel Coenen <manuel.coenen@gmail.com>
pkgname=duetwebserver-bin
pkgver=3.2.2
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
md5sums_armv7h=('53acd3ec6a038124410814e2727fa5eb')
md5sums_aarch64=('83cd800193d942e75d77eff4a45c69a9')
sha1sums_armv7h=('162a25f078a09bf977888ec23d5700ba7ed3e706')
sha1sums_aarch64=('38d31367ed25185c180ff529e8ee7f0bef58ceb6')
sha256sums_armv7h=('ba8f20cef0c444f36598b5a65f4badc7b121cde4ac52bee03c87a15d8d80e21c')
sha256sums_aarch64=('586e39be06f5a73d91eae9f9054a66681686a73b641e47a21f3f26f1d634b19e')
sha512sums_armv7h=('9ef5efc9e0caed40a55fc96b2b7a16adb833ab96ddbc1aabb128ea89cbaef896c69d725e9a11c090f89dfb15fa4e51478543fea47067f7e5bb865fe9edde5f4a')
sha512sums_aarch64=('1c9be42a08353eabfaec35cd652071b87dd88c14afe77ce6722f4042e8c37b444fa79d224eeca8f4497ff9d881a3f3a7b0af0c7c51c3f149734b25016bde9872')


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
