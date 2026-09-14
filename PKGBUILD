# Maintainer: taotieren <admin@taotieren.com>

pkgname=xfel
pkgver=1.4.0
pkgrel=1
epoch=
pkgdesc="Tiny FEL tools for allwinner SOC, support RISC-V D1 chip."
arch=($CARCH)
url="https://github.com/xboot/xfel"
license=('MIT')
groups=()
depends=(
    'libusb'
    'glibc')
makedepends=(
    git
    gcc
)
checkdepends=()
optdepends=()
provides=()
conflicts=(xfel)
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname}::git+${url}.git#tag=v${pkgver}")
noextract=()
sha256sums=('71f0c90cef56fe0a1389bc0ddef985f93e60976deae6c4d0eb77fa0586af8a4a')
#validpgpkeys=()

prepare() {
	git -C "${srcdir}/${pkgname}" clean -dfx
}

build() {
    cd "${srcdir}/${pkgname}"
    make
}

package() {
    install -Dm0755 "${srcdir}/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm0644 "${srcdir}/${pkgname}/99-xfel.rules" "${pkgdir}/etc/udev/rules.d/99-xfel.rules"
    install -Dm0644 "${srcdir}/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
