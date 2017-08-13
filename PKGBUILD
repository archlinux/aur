# Maintainer: krypt.co <aur@>
pkgname=kr
pkgver=2.2.7
pkgrel=1
pkgdesc="SSH using a key stored in Kryptonite"
arch=('i686' 'x86_64')
url="https://github.com/kryptco/kr"
license=('custom')
groups=()
depends=('gcc-libs-multilib')
makedepends=('rust' 'cargo' 'go')
checkdepends=()
optdepends=()
provides=('kr')
conflicts=('kr')
backup=()
options=()
install=kr.install
changelog="https://krypt.co/app/krd_changelog/"
source=("git+https://github.com/kryptco/kr#tag=$pkgver")
md5sums=('SKIP') 
validpgpkeys=()

pkgver() {
  cd ${srcdir}/src/github.com/kryptco/kr
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    mkdir -p "${srcdir}/src/github.com/kryptco/"
    rm -rf "${srcdir}/src/github.com/kryptco/kr"
    mv "${srcdir}/kr" "${srcdir}/src/github.com/kryptco/kr"
}

build() {
	cd "${srcdir}/src/github.com/kryptco/kr"
    GOPATH=${srcdir} make
}

check() {
	cd "${srcdir}/src/github.com/kryptco/kr"
    GOPATH=${srcdir} make check
}

package() {
	cd "${srcdir}/src/github.com/kryptco/kr"
    install -D -m 644 "LICENSE" "${pkgdir}/usr/share/licenses/kr-git/LICENSE"
    install -D -m 755 "bin/kr" "${pkgdir}/usr/bin/kr"
    install -D -m 755 "bin/krd" "${pkgdir}/usr/bin/krd"
    install -D -m 755 "bin/krssh" "${pkgdir}/usr/bin/krssh"
    install -D -m 755 "bin/krgpg" "${pkgdir}/usr/bin/krgpg"
    install -D -m 755 "bin/kr-pkcs11.so" "${pkgdir}/usr/lib/kr-pkcs11.so"
}
