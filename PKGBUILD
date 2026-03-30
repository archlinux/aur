# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc="Abstract fast-paced vertical scroll shoot'em up"
pkgname=noiz2sa
pkgver=0.52
pkgrel=1
url=http://www.asahi-net.or.jp/~cs8k-cyu/windows/noiz2sa_e.html
license=(custom:BSD)
depends=(sdl_mixer libbulletml)
arch=(x86_64)
source=("http://abagames.sakura.ne.jp/windows/${pkgname}${pkgver//./_}.zip"
        noiz2sa.patch Makefile.unix)
sha512sums=('bd240c472575c503acc18439620be9743a8089a886902b2f715a2c9974c74dc57c12e5dc9dd5bbf1c1b0c327c0aa08bca985e23afa84f3724d524e23370729c7'
            'ede8411fbc9bb58ccce8130007b697f7de5b63a1e5c3895cf4a3ea8e8598eff214b00a66b731f2a1d5cc886130358bddf644c71506f0881490023838be2fe1b9'
            'f762916ebd6574622229daeff9e6a1c735b4c6d3c4d04529b33aa245c635abe168194367f158087cf16a9268d4a3f4d4bf217b113320f471d9dd3655b07731bb')

prepare () {
	cd "${pkgname}"
	patch -p0 < "${srcdir}/noiz2sa.patch"
	cp "${srcdir}/Makefile.unix" src/
}

build () {
	make -C "${pkgname}/src" -f Makefile.unix MORE_CFLAGS="${CFLAGS}" MORE_LDFLAGS="${LDFLAGS}"
}

package () {
	cd "${pkgname}"
	install -Dm755 src/noiz2sa "${pkgdir}/usr/bin/noiz2sa"
	install -dm755 "${pkgdir}/usr/share/noiz2sa"
	cp -r boss images middle ogg sounds zako "${pkgdir}/usr/share/noiz2sa/"
	install -Dm644 readme_e.txt "${pkgdir}/usr/share/doc/${pkgname}/README"
	install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
	ln -snf "../../doc/${pkgname}/README" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
