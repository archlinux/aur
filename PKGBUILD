# Maintainer: lambdadroid <lambdadroid@gmail.com>
pkgname=me176c-acpi
pkgver=r22.9c25272
pkgrel=1
pkgdesc="Patched ACPI DSDT table for ASUS MeMO Pad 7 (ME176C(X))"
arch=(any)
url="https://github.com/me176c-dev/$pkgname"
license=('unknown')
makedepends=(acpica)
options=('!strip')
_revision=9c25272d67965b7bbc03283e333822f02a8f9a9a
source=("git+https://github.com/me176c-dev/me176c-acpi.git#commit=$_revision")
sha256sums=('SKIP')

build() {
    iasl "$pkgname"/dsdt.dsl

    mkdir -p kernel/firmware/acpi
    cp "$pkgname"/dsdt.aml kernel/firmware/acpi/dsdt.aml
    echo kernel/firmware/acpi/dsdt.aml | bsdcpio -o -H newc -R 0:0 -O acpi.img
}

package() {
    install -Dm644 acpi.img "$pkgdir"/boot/acpi-me176c.img
}
