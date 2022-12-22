# Maintainer: Moses Narrow <moe_narrow@skycoin.com>
pkgname=depth
pkgver='1.2.1'
pkgrel=1
pkgdesc="Visualize Go Dependency Trees"
arch=( 'i686' 'x86_64' 'aarch64' 'armv8' 'armv7' 'armv7l' 'armv7h' 'armv6h' 'armhf' 'armel' 'arm' )
_pkgname=${pkgname}
_projectname=KyleBanks
_githuborg="${FORK:-$_projectname}"
_pkggopath="github.com/${_githuborg}/${_pkgname}"
url="https://${_pkggopath}"
license=('GPL')
makedepends=('go' 'git')
source=("git+${url}.git#branch=${BRANCH:-master}"
        )
sha256sums=('SKIP')

pkgver() {
_version=$(git ls-remote --tags --refs --sort="version:refname" ${url}.git | tail -n1)
_version=${_version##*/}
_version=${_version%%-*}
_version=${_version//v/}
echo ${_version}
}

build() {
	cd "${srcdir}/${_pkgname}"
  go build "cmd/${_pkgname}/${_pkgname}.go"

}

package() {
  install -Dm755 "${srcdir}/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${srcdir}/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
