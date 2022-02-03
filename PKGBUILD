# Submitter:   Anton Yermalovich <zuzu@bk.ru>
# Maintainer:  Yousef Amar <yousef@amar.io>
# Contributor: zwergnase <zwergnase@posteo.de>

pkgname=sunvox
pkgver=2.0c
pkgrel=1
pkgdesc="Small, fast and powerful modular synthesizer with pattern-based sequencer (tracker)."
arch=('i686' 'x86_64')
url="http://warmplace.ru/soft/sunvox/"
license=(custom)
groups=()
depends=(
	'libx11'
	'glibc'
	'gcc-libs'
	'alsa-lib'
	'sdl'
	'libxcb'
	'libxau'
	'libxdmcp'
	'gendesk'
)
makedepends=('unzip')
source=(http://warmplace.ru/soft/sunvox/$pkgname-$pkgver.zip)
md5sums=('318d70fc52496f03fdd1b8db999072f3')

prepare() {
	gendesk --pkgname "$pkgname" --pkgdesc "$pkgdesc"
}

package() {
	install -dm755 "${pkgdir}/opt/${pkgname}"
	install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
	install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

	if [ "$CARCH" = "x86_64" ]; then
		install -Dm755 "${srcdir}/sunvox/sunvox/linux_x86_64/sunvox" "${pkgdir}/usr/bin/sunvox"
	else
		install -Dm755 "${srcdir}/sunvox/sunvox/linux_x86/sunvox" "${pkgdir}/usr/bin/sunvox"
		install -Dm755 "${srcdir}/sunvox/sunvox/linux_x86/sunvox_lofi" "${pkgdir}/usr/bin/sunvox_lofi"
		install -Dm755 "${srcdir}/sunvox/sunvox/linux_x86/sunvox_no_simd" "${pkgdir}/usr/bin/sunvox_no_simd"
	fi

	cp -a "${srcdir}/sunvox/examples" "${pkgdir}/opt/${pkgname}/examples"
	cp -a "${srcdir}/sunvox/instruments" "${pkgdir}/opt/${pkgname}/instruments"
	cp -a "${srcdir}/sunvox/effects" "${pkgdir}/opt/${pkgname}/effects"
	install -Dm644 "${srcdir}/sunvox/docs/license/sunvox.txt"  "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
