# Contributor: Vojtech Kral <vojtech_kral^hk>

pkgname=futuro-cube-suite
pkgver=1.7
pkgrel=1
pkgdesc="Rubik’s Futuro Cube Suite 1.7 - Software updater, manager & development tool."
arch=('i686' 'x86_64')
url="http://www.futurocube.com/help/"
license=('mixed')
depends=('python2' 'ipython2' 'python2-imaging' 'python2-pyserial' 'wxpython2.8')
[[ $CARCH == 'x86_64' ]] && depends+=('lib32-glibc')
install=install
source=(
	"http://isle.princip.cz/download/futurocube/sdk_suite/rubiks-futuro-cube.SC${pkgver}.tgz"
	'futuro-cube-suite'
	'futuro-cube-suite.desktop'
	'95-futurocube.rules')
sha256sums=('18f60ec456eeab4ec36c261ab52540aab6a40a9d0e36c52260612067614fc142'
            '3587a987aeca87731e2430a6099f14d7c7dac93da4cb0fc2ac5dace45783abab'
            'c7f4d78cf38a06125b8ddfb78ad1adda801c875be1b9ddc2f75617c28546f885'
            '01cdf49a8322dcf6b8d2c85143a2e5e5b4d0a9901755cab8e1fd8924c203443a')

package()
{
	cd "${srcdir}/rubiks-futuro-cube"
	install -d -m 755 "${pkgdir}/usr/bin/"
	install -d -m 755 "${pkgdir}/usr/lib/futuro-cube-suite"
	install -d -m 755 "${pkgdir}/usr/share/licenses"
	install -d -m 755 "${pkgdir}/etc/udev/rules.d"

	install -m 755 "${srcdir}/futuro-cube-suite" "${pkgdir}/usr/bin/"
	install -m 755 lib/futurocubesuite/bin/{pawncc,pawndisasm} "${pkgdir}/usr/bin/"
	cp -r lib/{futurocubesuite,gbase,usbmonitor,utils,wxutils} "${pkgdir}/usr/lib/futuro-cube-suite/"
	ln -sT '/usr/lib/futuro-cube-suite/futurocubesuite/doc/license' "${pkgdir}/usr/share/licenses/futuro-cube-suite"
	desktop-file-install --dir="${pkgdir}/usr/share/applications/" "${srcdir}/futuro-cube-suite.desktop"
	install -m 644 "${srcdir}/95-futurocube.rules" "${pkgdir}/etc/udev/rules.d/"
}

# vim:set ts=2 sw=2 et:
