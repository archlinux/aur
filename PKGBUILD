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
source=("$url/archive/$_revision.tar.gz")
sha256sums=('27472e956aef89c0fdd9b1edfb79e6eb1ab28b76bcc13d86a2ea6aa7dd83a5ae')

build() {
    local dir="$pkgname-$_revision"
    iasl "$dir"/dsdt.dsl

    mkdir -p kernel/firmware/acpi
    cp "$dir"/dsdt.aml kernel/firmware/acpi/dsdt.aml
    echo kernel/firmware/acpi/dsdt.aml | bsdcpio -o -H newc -R 0:0 -O acpi.img
}

package() {
    install -Dm644 acpi.img "$pkgdir"/boot/acpi-me176c.img
}
