# Maintainer: taotieren <admin@taotieren.com>

pkgname=xfel
pkgver=1.3.5
pkgrel=3
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
sha256sums=('c08a8a0d6a01c59598ce6f1622956dbad515919d89025e4a5d21e63f6623010a')
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
