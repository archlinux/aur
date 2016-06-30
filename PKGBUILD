# Maintainer: Johannes Loher <johannes dor loher at fg4f dot de>

pkgname='dfix'
pkgver=0.3.1
pkgrel=2
pkgdesc='Tool for automatically upgrading D source code'
arch=('i686' 'x86_64')
url='https://github.com/Hackerpilot/dfix'
license=('custom: BSL')
groups=('dlang')
depends=('gcc-libs')
makedepends=('dmd' 'git')
provides=('dfix')
source=("git://github.com/Hackerpilot/${pkgname}#tag=v${pkgver}"
'http://www.boost.org/LICENSE_1_0.txt')
md5sums=('SKIP'
         'e4224ccaecb14d942c71d31bef20d78c')

prepare() {
	cd "${srcdir}/${pkgname}"
	git submodule update --init --recursive
}

build() {
	cd "${srcdir}/${pkgname}"
	make "${pkgname}_binary"
}

package(){
	# binaries
	mkdir -p "${pkgdir}/usr/bin"
	install -m755 -t "${pkgdir}/usr/bin" "${srcdir}/${pkgname}/bin/${pkgname}"

	# license
	mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
	install -m644 LICENSE_1_0.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
