# Maintainer: Johannes Loher <johannes dor loher at fg4f dot de>
_gitname=dfix
pkgname="${_gitname}-git"
pkgver=0.3.2.r0.g396fd6b
pkgrel=1
pkgdesc='Tool for automatically upgrading D source code - git version'
arch=('i686' 'x86_64')
url='https://github.com/dlang-community/dfix'
license=('custom: BSL')
groups=('dlang')
depends=('gcc-libs')
makedepends=('dmd' 'git')
provides=("${_gitname}")
conflicts=("${_gitname}")
source=("git://github.com/dlang-community/${_gitname}.git"
'http://www.boost.org/LICENSE_1_0.txt')
md5sums=('SKIP'
         'e4224ccaecb14d942c71d31bef20d78c')

pkgver() {
  cd "${srcdir}/${_gitname}"
  git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
	cd "${srcdir}/${_gitname}"
	git submodule update --init
}

build() {
	cd "${srcdir}/${_gitname}"
	make "${_gitname}_binary"
}

package(){
	# binaries
	mkdir -p "${pkgdir}/usr/bin"
	install -m755 -t "${pkgdir}/usr/bin" "${srcdir}/${_gitname}/bin/${_gitname}"

	# license
	mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
	install -m644 LICENSE_1_0.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
