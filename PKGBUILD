# Maintainer: Maxim De Clercq <maximdeclercq00@gmail.com>

pkgname=cmsis-toolbox
pkgver=2.5.0
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
sha256sums=(
  'f8f47068d24f0dd8ff1de4e38c374abd55a2cc44ea59f3d0b7e5e76d634ac9bd'
  'ec235e9755441204824c02334a1851bcbde687e660beb9ccf9e1edbff7541422'
)

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
