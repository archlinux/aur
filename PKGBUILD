# Maintainer: Cain Atkinson <yellowsink@protonmail.com>

_pkgname="reggie"
pkgname="${_pkgname}-git"
pkgver=r25.aa569e9
pkgrel=1
pkgdesc="A new regex replace CLI tool, as an alternative to sed."
arch=('x86_64')
url="https://github.com/cainy-a/reggie"
license=('GPL3')
groups=()
depends=()
makedepends=('git' 'dotnet-sdk>=5.0.0' 'dotnet-targeting-pack>=5.0.0')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
backup=("usr/share/${_pkgname}/data")
source=("${_pkgname}-source::git+${url}#branch=master")
md5sums=('SKIP')
options=('!strip')

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
	dotnet publish -r linux-x64 --self-contained -c Release
}

#check() {
#	cd "$srcdir/${pkgname%-VCS}"
#	make -k check
#}

package() {
	cd "${_pkgname}-source"
	install -Dm 755 "Reggie/bin/Release/net5.0/linux-x64/publish/Reggie" "${pkgdir}/usr/bin/${_pkgname}"
}
