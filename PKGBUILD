# Maintainer: Kabir Sala <aur AT mail DOT ksala DOT eu>
# Inspired by the 'scrt' package by Remy van Elst (https://aur.archlinux.org/packages/scrt/)
#
# How to install:
# 1. Download this package, but don't build it
#    With Pacaur: AURDEST=. pacaur -d scrt-sfx
#    Or just download all the files manually from AUR
# 2. Download
#    scrt-sfx-8.1.4.1443.ubuntu16.tar.gz	(for 32bit systems)
#    scrt-sfx-8.1.4.1443.ubuntu16-64.tar.gz	(for 64bit systems)
#    From https://vandyke.com/download/securecrt/download.html
#    (You'll need a free account, SecureCRT/FX will ask for the license at startup)
#    And put in the same folder as the PKGBUILD
# 3. Run makepkg -i and enjoy!

pkgname=scrt-sfx
pkgver=8.1.4
incrver=1443
pkgrel=1
pkgdesc="Vandyke SecureCRT & SecureFX SSH Client"
arch=('x86_64' 'i686')
url="http://www.vandyke.com"
license=('custom')
depends=('openssl' 'glibc' 'qt4' 'libpng12' 'openssl-1.0')
depends_i686=('lib32-openssl-1.0')
provides=('scrt' 'sfx')
options=('!strip')
source=("run_securecrt.sh" "run_securefx.sh")
md5sums=('f46dbfcf871ed5056742ad2b4d0a6051' 'e64a26ecdc092367dfd5bbd4035e9923')
source_i686=("${pkgname}-${pkgver}.${incrver}.ubuntu16.tar.gz::file://${pkgname}-${pkgver}.${incrver}.ubuntu16.tar.gz")
source_x86_64=("${pkgname}-${pkgver}.${incrver}.ubuntu16-64.tar.gz::file://${pkgname}-${pkgver}.${incrver}.ubuntu16-64.tar.gz")
md5sums_i686=('64b52eb4cbb4190f2cec8737977bc1dc')
md5sums_x86_64=('0ae3a8ae3df9927cc457b7566af70d62')

package() {
	install -Dm 755 ./run_securecrt.sh ${pkgdir}/usr/bin/SecureCRT
	install -Dm 755 ./run_securefx.sh ${pkgdir}/usr/bin/SecureFX

	cd "${srcdir}"/${pkgname}-${pkgver}
	install -Dm 755 ./SecureCRT ${pkgdir}/usr/lib/securecrt/SecureCRT
	install -Dm 644 ./SecureCRT.desktop ${pkgdir}/usr/share/applications/SecureCRT.desktop
	install -Dm 644 ./securecrt_64.png ${pkgdir}/usr/share/vandyke/data/securecrt_64.png

	install -Dm 644 ./SecureCRT_HISTORY.txt ${pkgdir}/usr/share/doc/scrt/SecureCRT_HISTORY.txt
	install -Dm 644 ./SecureCRT_README.txt ${pkgdir}/usr/share/doc/scrt/SecureCRT_README.txt
	install -Dm 644 ./SecureCRT_SecureFX_EULA.txt ${pkgdir}/usr/share/doc/scrt/SecureCRT_EULA.txt 
	cp -r ./SecureCRTHelp ${pkgdir}/usr/share/doc/scrt/

	install -Dm 644 ./changelog.Debian.gz ${pkgdir}/usr/share/doc/scrt/changelog.Debian.gz

	install -Dm 755 ./SecureFX ${pkgdir}/usr/lib/securefx/SecureFX
	install -Dm 644 ./SecureFX.desktop ${pkgdir}/usr/share/applications/SecureFX.desktop
	install -Dm 644 ./securefx_64.png ${pkgdir}/usr/share/vandyke/data/securefx_64.png
	install -Dm 644 ./SecureFX_HISTORY.txt ${pkgdir}/usr/share/doc/sfx/SecureFX_HISTORY.txt
	install -Dm 644 ./SecureFX_README.txt ${pkgdir}/usr/share/doc/sfx/SecureFX_README.txt
	install -Dm 644 ./SecureCRT_SecureFX_EULA.txt ${pkgdir}/usr/share/doc/sfx/SecureFX_EULA.txt 
	cp -r ./SecureFXHelp ${pkgdir}/usr/share/doc/sfx/
}
