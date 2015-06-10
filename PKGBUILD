# Maintainer: Heine Pedersen <heinep at gmail dot com>
# Contributor: Thomas Matysik <thomas at matysik dot co dot nz>

_realname=WebGUI-Linux
_pkgver=2.1.5
_pkgrelmajor=13
_pkgrelminor=0409

pkgname=hptwebgui
pkgver=${_pkgver}.${_pkgrelmajor}${_pkgrelminor}
pkgrel=2

pkgdesc="WebGUI for HighPoint RocketRaid 2xxx/3xxx/4xxx RAID Controllers"
arch=('x86_64')
url="http://www.highpoint-tech.com"
license=('custom')
makedepends=('rpmextract')
provides=('hptwebgui')
conflicts=('hpt-cli')
install=hptwebgui.install
source=(http://www.highpoint-tech.com/BIOS_Driver/HRM/Linux/${_realname}-v${_pkgver}-${_pkgrelmajor}${_pkgrelminor}.tgz
	hptwebgui.service)

md5sums=('e65216725b279e74d583768a989e2ee7'
         '00c19d865b93cd635fbea78b32af7787')

package() {
	rpmextract.sh "${srcdir}"/hptsvr-https-${_pkgver}-${_pkgrelmajor}.${_pkgrelminor}.${arch}.rpm
	install -m755 -d "${pkgdir}/usr/bin"
	install -m755 -d "${pkgdir}/usr/share/hpt"
	install -m755 -d "${pkgdir}/usr/lib/systemd/system"
	install -m755 "${srcdir}/usr/bin/hptsvr" "${pkgdir}/usr/bin/"
	install -m644 "${srcdir}/hptwebgui.service" "${pkgdir}/usr/lib/systemd/system/"
	cp -R "${srcdir}/usr/share/hpt/"* "${pkgdir}/usr/share/hpt"
}
