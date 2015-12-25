# Maintainer: Rohan Rao <rao dot rohan dot a at gmail dot com>

pkgname=boost-build-git
_gitname=build
_pkgname=boost-build
pkgver=r11135.7d80077
pkgrel=1
pkgdesc='Boost.Build makes it easy to build C++ projects, everywhere.'
arch=('any')
url="http://www.boost.org/build/"
license=('custom:boost')
depends=('boost' 'gcc' 'python')
conflicts=('boost-build' 'boost-build-nightly')
source=("git+https://github.com/boostorg/build.git"
        "http://www.boost.org/LICENSE_1_0.txt")
md5sums=('SKIP' 'e4224ccaecb14d942c71d31bef20d78c')

pkgver() {
	cd "${srcdir}/${_gitname}"

	# Get the version number.
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd ${srcdir}

	mkdir -p ${pkgdir}/usr/share
	mkdir -p ${pkgdir}/etc

	cp -R ${_gitname} ${pkgdir}/usr/share
	mv ${pkgdir}/usr/share/${_gitname} ${pkgdir}/usr/share/${_pkgname}
	rm -Rf ${pkgdir}/usr/share/${_pkgname}/.git

	install -Dm644 LICENSE_1_0.txt "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

	echo "using gcc ;" > ${pkgdir}/etc/site-config.jam
}
