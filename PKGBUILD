# Maintainer: xx777 <zenmchen at gmail dot com>
# Contributor: PRESFIL <echo cHJlc2ZpbEBwcm90b25tYWlsLmNvbQo= | base64 -d>
# Contributor: librewish <librewish@gmail.com
# Contributor: Bjoern Franke <bjo+aur@schafweide.org>
# Contributor: feanor1397 <feanor1397@gmail.com>

_pkgbase=rtw88
pkgname=rtw88-dkms-git
pkgver=r443.5db1508
pkgrel=1
pkgdesc='Driver for Realtek 802.11ac wireless chips'
license=('GPL2' 'custom')
arch=('any')
url='https://github.com/lwfinger/rtw88'
depends=('dkms' 'linux-firmware')
makedepends=('git')
source=("git+https://github.com/lwfinger/rtw88.git"
	"blacklist-rtw88.conf"
	"dkms.conf")
sha256sums=('SKIP'
	    'fc45e3db3af0b047d9dcf656bfa84cf74f1d919e25a3f39bb4a47d940bed8cac'
	    '5c0ac522558cd8d9ed1549d474eb5deccbe7d9a2643e0906b80d7d6983fbc4b4')

pkgver() {
    cd "${srcdir}"/${_pkgbase}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
	cd "${srcdir}"/${_pkgbase}
	install -Dm 644 -t "${pkgdir}"/usr/lib/firmware/rtw88 rtw8812a_fw.bin
	install -Dm 644 -t "${pkgdir}"/usr/src/${_pkgbase}-${pkgver} *.c *.h Makefile
	install -Dm 644 -t "${pkgdir}"/usr/src/${_pkgbase}-${pkgver} "${srcdir}"/dkms.conf
	install -Dm 644 -t "${pkgdir}"/etc/modprobe.d "${srcdir}"/blacklist-rtw88.conf
}
