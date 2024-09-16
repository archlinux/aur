# Maintainer: Hoream <hoream@qq.com>
_pkgname="sshx"
pkgname="${_pkgname}-git"
pkgver=r291.b48804b
pkgrel=1
pkgdesc="A secure web-based, collaborative terminal."
url="https://github.com/ekzhang/sshx"
license=("MIT")
arch=('x86_64')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('gcc-libs' 'gcc-libs' 'glibc')
makedepends=("cargo" "git" "protobuf")
source=(${_pkgname}::git+${url})
sha256sums=('SKIP')
options=('!lto')


pkgver() {
  cd "${srcdir}/${_pkgname}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build(){
 	cd "${srcdir}/${_pkgname}"
    cargo build --release
}

package() {
	install -d "${pkgdir}/usr/bin"
	install -Dm755 "${srcdir}/${_pkgname}/target/release/${_pkgname}" "${pkgdir}/usr/bin/${pkg_name}"
    install -Dm644 "${srcdir}/${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${_pkgname}/"
}
