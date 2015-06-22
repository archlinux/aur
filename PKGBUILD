# Maintainer: Vojtech Kral <vojtech_kral^hk>

pkgname=samorost2
pkgver=1.0
pkgrel=6
pkgdesc="Samorost 2 is an award-winning point-and-click adventure/puzzle Flash game by Amanita Design"
arch=('i686' 'x86_64')
url="http://amanita-design.net/samorost-2/"
license=('unknown')
depends=('xdg-utils' 'flashplugin')
install=install

source=(samorost2
        samorost2.desktop)

sha256sums=('594dc311057d005bcc0d2b9989c0f095ed8f57c75d9003cc52978d2eb7c87829'
            '7af55922b26b62704645dc928464444361754e4f6e7e348e6ba55efb997be2af')

_distname='samorost2_linux.zip'
_distsum='1e6304b203cbe05e2e7d85b2f062142decb70084ebd7cfbee4475d91a048aad6'

package()
{
	cd ..
	if [ ! -f "${_distname}" ]
	then
		echo "${_distname} needs to be supplied by the user. Please place it in the directory alongside the PKGBUILD file."
		exit 1
	fi
	echo "${_distsum} ${_distname}" | sha256sum -c || exit 1
	mkdir -p ${pkgdir}/usr/share/samorost2
	bsdtar -xf samorost2_linux.zip -C ${pkgdir}/usr/share/samorost2/
	find ${pkgdir}/usr/share/samorost2/ -type d -exec chmod 755 '{}' \;
	find ${pkgdir}/usr/share/samorost2/ -type f -exec chmod 644 '{}' \;
	cd "${srcdir}"
	install -D -m755 'samorost2' ${pkgdir}/usr/bin/samorost2
	desktop-file-install --dir=${pkgdir}/usr/share/applications/ 'samorost2.desktop'
}
