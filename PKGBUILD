# Maintainer: gigamicro <gammamicro@gmail.com>
pkgdesc='Understated cursor theme - black, tailless'
pkgname=(xcursor-cz-hickson-{black,white})
pkgver=20210706
pkgrel=0
_commit=02a7977b3d009525c95787c756fce8d824960e4c
license=(GPL3)
url="https://github.com/charakterziffer/cursor-toolbox"
_repo=${url##*/}
arch=(any)
makedepends=(git xorg-xcursorgen)
source=("git+${url}#commit=${_commit}" build.patch)
sha512sums=('SKIP' 'c2b8792e0a9afd639864608dc674acbc1a368d9a83cd46dd3422403961af2b001c3eb004269eb701fcd34f4cfceaca5912a751a6ecd68ad08901ec94e0afb972')

prepare () {
	cd "${srcdir}/${_repo}"
	git apply -p1 "${srcdir}/build.patch"
}

build () {
	cd "${srcdir}/${_repo}/more-themes/cz-Hickson"
	for pngs in pngs-*; do
		ln -sfT "${pngs}" pngs; themetitle="cz-Hickson-${pngs#pngs-}" "${srcdir}/${_repo}/make.sh"
	done
	rm pngs
}

package_xcursor-cz-hickson-black () {
	install -dm755 "${pkgdir}/usr/share/icons/"
	cp -at "${pkgdir}/usr/share/icons/" "${srcdir}/${_repo}/more-themes/cz-Hickson/cz-Hickson-${1:-black}"
}
package_xcursor-cz-hickson-white(){
	pkgdesc='Understated cursor theme - white, tailless'
	package_xcursor-cz-hickson-black white
}
