# Maintainer: taotieren <admin@taotieren.com>

pkgname=openrockcli
pkgver=1
pkgrel=2
epoch=
pkgdesc="A command-line and lightweight TUI firmware flashing tool for Rockchip SoCs"
arch=($CARCH)
url="https://github.com/dshanpi/openrockcli"
license=('MIT')
groups=()
depends=(
    libusb
)
makedepends=(
    git
)
checkdepends=()
optdepends=(
    "rkbin: Rockchip update.img flashing through the SDK bundled upgrade_tool"
)
provides=(${pkgname})
conflicts=(${pkgname})
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname}::git+${url}.git#tag=v${pkgver}")
noextract=()
sha256sums=('dc83c34612940843a6ef6ab83c597f827c743607e348fa7b7d0759af66cd56a6')
#validpgpkeys=()

prepare() {
	git -C "${srcdir}/${pkgname}" clean -dfx
    cd "${srcdir}/${pkgname}"
    sed -i 's|MODE="0666", GROUP="users"|TAG+="uaccess",|g' 99-openrockcli.rules
}

build() {
    cd "${srcdir}/${pkgname}"
    make
}

package() {
    cd "${srcdir}/${pkgname}"
    install -vDm0755 ${pkgname} -t"${pkgdir}/usr/bin/"
    install -vDm0644 *.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
    install -vDm0644 *.rules -t "${pkgdir}/usr/lib/udev/rules.d/"
    install -vDm0644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
