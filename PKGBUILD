pkgname=hp-wmi-dkms
pkgver=1.0
pkgrel=3
pkgdesc="Patched hp-wmi kernel module with fan control fixes for HP Victus/Omen (pre-7.1 kernels)"
arch=('any')
url="https://github.com/emomaxd/hpfand"
license=('GPL-2.0-only')
depends=('dkms')
install=hp-wmi-dkms.install
source=(
    "hp-wmi.c::https://raw.githubusercontent.com/emomaxd/linux/hp-wmi-victus-fan-v4/drivers/platform/x86/hp/hp-wmi.c"
    "dkms.conf"
    "Makefile"
    "hp-wmi-dkms.install"
)
sha256sums=('b78469d1ebe5ce82f64a8998f80b1b0480918412c4bf80171e6b7ff78653eb0f'
            '73adb7825484ada78d4631e4faaef035104c0d458e31743b507207e14022479b'
            '27590eeaeace6a376fbf25690752b9e8a775843218126ffaf236ba6d669eef69'
            '230126dc83e9bda34caf8b14a380bfe3501948ac796d4d939fc4f00516c0cdd4')

package() {
    local srcdir_dkms="$pkgdir/usr/src/$pkgname-$pkgver"
    install -dm755 "$srcdir_dkms"

    install -m644 hp-wmi.c  "$srcdir_dkms/"
    install -m644 Makefile   "$srcdir_dkms/"
    install -m644 dkms.conf  "$srcdir_dkms/"
    sed -i "s/@PKGVER@/$pkgver/" "$srcdir_dkms/dkms.conf"
}
