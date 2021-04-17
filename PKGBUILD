# Maintainer: Cain Atkinson <yellowsink@protonmail.com>

_pkgname="reggie"
pkgname="${_pkgname}-git"
pkgver=r8.324e7ce
pkgrel=2
pkgdesc="A new regex replace CLI tool, as an alternative to sed."
arch=('x86_64')
url="https://github.com/cainy-a/reggie"
license=('GPL3')
groups=()
depends=('dotnet-runtime>=5.0.0' 'dotnet-host>=5.0.0')
makedepends=('git' 'dotnet-sdk>=5.0.0' 'dotnet-targeting-pack>=5.0.0')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
backup=("usr/share/${_pkgname}/data")
source=("${_pkgname}-source::git+${url}#branch=master")
md5sums=('SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "${_pkgname}-source"

# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

#prepare() {
#
#}

build() {
	cd "${_pkgname}-source"

	# build with dotnet
	cd Reggie
	dotnet build
}

#check() {
#	cd "$srcdir/${pkgname%-VCS}"
#	make -k check
#}

package() {
	cd "${_pkgname}-source"
	
	# copy build folder
	mkdir -p "${pkgdir}/usr/lib/${_pkgname}/"
	cp -r --preserve=mode "Reggie/bin/Debug/net5.0/"* "${pkgdir}/usr/lib/${_pkgname}/"
	# add to bin
	mkdir -p "${pkgdir}/usr/bin/"
	ln -s "${pkgdir}/usr/lib/${_pkgname}/Reggie" "${pkgdir}/usr/bin/${_pkgname}"
}
