# Maintainer: Maxim De Clercq <maximdeclercq00@gmail.com>

pkgname=cmsis-toolbox
pkgver=2.12.0
pkgrel=1
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
sha256sums=('ee3efa43eb4124c8029434ce59b6613d3a34570325addb9d5e354b0e3c420ba8'
            'ec235e9755441204824c02334a1851bcbde687e660beb9ccf9e1edbff7541422')

package() {
    cd "$srcdir/cmsis-toolbox-linux-amd64"
    install -d "$pkgdir/opt/$pkgname"

    # Install binaries
    install -d "$pkgdir/opt/$pkgname/bin"
    install -Dm755 bin/* "$pkgdir/opt/$pkgname/bin"

    # Install configuration files
    install -d "$pkgdir/opt/$pkgname/etc"
    cp -dr --no-preserve=ownership etc/* "$pkgdir/opt/$pkgname/etc"

    # Install license
    install -d "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Install documentation
    install -d "$pkgdir/usr/share/doc/$pkgname"
    install -Dm644 doc/* -t "$pkgdir/usr/share/doc/$pkgname/"

    # Install profile exports
    install -Dm644 "$srcdir/$pkgname.sh" -t "$pkgdir/etc/profile.d"
}

# vim:set ts=2 sw=2 et:
