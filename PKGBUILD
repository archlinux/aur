# Maintainer: Maxim De Clercq <maximdeclercq00@gmail.com>

pkgname=cmsis-toolbox
pkgver=2.4.0
pkgrel=3
pkgdesc="CMSIS Toolbox for ARM Cortex-M software development"
arch=('x86_64')
url="https://github.com/Open-CMSIS-Pack/cmsis-toolbox"
license=('Apache')
depends=(
  'arm-none-eabi-binutils'
  'arm-none-eabi-gcc'
  'arm-none-eabi-gdb'
  'arm-none-eabi-newlib'
)
source=(
  "cmsis-toolbox-linux-amd64.tar.gz::https://github.com/Open-CMSIS-Pack/cmsis-toolbox/releases/download/$pkgver/cmsis-toolbox-linux-amd64.tar.gz"
  "cmsis-toolbox.sh"
)
sha256sums=(
  '5d3ee2037c0b729e4834c5bc368dac11d14fd9fc530055dd6335da345be5633e'
  '37f754791182725054051d6f05499663befa273261490336d691153de2c38077'
)

package() {
    cd "$srcdir/cmsis-toolbox-linux-amd64"

    # Install binaries
    install -d "$pkgdir/usr/bin"
    install -Dm755 bin/* "$pkgdir/usr/bin/"

    # Install configuration files
    install -d "$pkgdir/etc/$pkgname"
    cp -dr --no-preserve=ownership etc/* "$pkgdir/etc/$pkgname"

    # Install license
    install -d "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Install documentation
    install -d "$pkgdir/usr/share/doc/$pkgname"
    install -Dm644 doc/* -t "$pkgdir/usr/share/doc/$pkgname/"

    # Install profile exports
    install -Dm644 "$srcdir/$pkgname.sh" -t "$pkgdir/etc/profile.d/$pkgname.sh"
}

# vim:set ts=2 sw=2 et:
