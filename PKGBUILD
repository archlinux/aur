# Maintainer: OfficialKris <37947442+OfficialKris@users.noreply.github.com>

pkgname=go-boot
_pkgname="go-boot-1.2.1"
pkgver=v1.2.1
pkgrel=1
pkgdesc="The bare metal Go UEFI boot manager"
arch=(x86_64)
url="https://github.com/usbarmory/go-boot"
license=(BSD-3-Clause)
groups=()
depends=()
makedepends=('git' 'make' 'go')
provides=('go-boot')
source=(
    "https://github.com/usbarmory/tamago-go/archive/refs/tags/tamago-go1.25.5.tar.gz"
    "https://github.com/usbarmory/go-boot/archive/refs/tags/v1.2.1.tar.gz"
)
sha256sums=(
    '55ef8422851454c793a3645377daef32ae48a8af4cc4a14d980732c38bbad165'
    '8338112ee2269f3e4fd29f2dcfd835001b7706810a80a089e37accfb5ecbb4b8'
)

build() {
    cd "${srcdir}/tamago-go-tamago-go1.25.5/src"

    ./make.bash
    cd ../bin
    export TAMAGO=`pwd`/go

    cd "${srcdir}/${_pkgname}"

    make efi IMAGE_BASE=10000000 CONSOLE=text DEFAULT_EFI_ENTRY=\\EFI\\Linux\\arch-linux.efi
}

package() {
    cd "${srcdir}/${_pkgname}"

    # install x86 efi file
    install -vDm644 "go-boot.efi" "$pkgdir/usr/share/go-boot/go-boot.efi"

    # install license file
    install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
