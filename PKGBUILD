# Maintainer: psfloyd <peter.racoon@gmail.com>

pkgname='refind-theme-ambience-black-git'
pkgver='r46.446477f'
pkgrel=1
pkgdesc="Dark minimalistic theme for refind UEFI boot manager. Fork of refind-ambience."
arch=('any')
url="https://gitlab.com/psfloyd/refind-ambience-black.git"
license=('MIT')
depends=('refind-efi')
makedepends=('git')
source=('git+https://gitlab.com/psfloyd/refind-ambience-black.git')
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/refind-ambience-black"
	( set -o pipefail
	git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

package() {
	local _refind_home="${pkgdir}$(dirname $(find /boot -name "refind.conf" 2>/dev/null))"
	mkdir -p "${_refind_home}/themes"
	cp -r "${srcdir}/refind-ambience-black/refind-ambience-black" "${_refind_home}/themes"
	chmod -R 644 "${_refind_home}/themes/refind-ambience-black"
	install -Dm644 "${srcdir}"/refind-ambience-black/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	echo 'Remember to add "include themes/refind-ambience-black/theme.conf" to your refind.conf file'
}
