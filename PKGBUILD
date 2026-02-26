# Maintainer: taotieren <admin@taotieren.com>

pkgname=xrock
pkgver=1.1.2
pkgrel=7
epoch=
pkgdesc="The low level tools for rockchip SOC with maskrom and loader mode support."
arch=($CARCH)
url="https://github.com/xboot/xrock"
license=('MIT')
groups=()
depends=(
    'glibc'
    'libusb')
makedepends=(
    git
    gcc
)
checkdepends=()
optdepends=()
provides=()
conflicts=(xrock)
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname}::git+${url}.git#tag=v${pkgver}")
noextract=()
sha256sums=('31d49fe7dfbb8748a52c93869e63d02247b4f3a8a02a56a4a690c835bba22bda')
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
    install -Dm0644 "${srcdir}/${pkgname}/99-xrock.rules" "${pkgdir}/etc/udev/rules.d/99-xrock.rules"
    install -Dm0644 "${srcdir}/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
