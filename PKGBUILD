pkgname=hp-wmi-dkms
pkgver=1.0
pkgrel=1
pkgdesc="Patched hp-wmi kernel module with fan control fixes for HP Victus/Omen (pre-7.1 kernels)"
arch=('any')
url="https://github.com/emomaxd/hpfand"
license=('GPL-2.0-only')
depends=('dkms')
source=(
    "hp-wmi.c::https://raw.githubusercontent.com/emomaxd/linux/hp-wmi-fixes/drivers/platform/x86/hp/hp-wmi.c"
    "dkms.conf"
    "Makefile"
)
sha256sums=('SKIP' 'SKIP' 'SKIP')

package() {
    local srcdir_dkms="$pkgdir/usr/src/$pkgname-$pkgver"
    install -dm755 "$srcdir_dkms"

    install -m644 hp-wmi.c  "$srcdir_dkms/"
    install -m644 Makefile   "$srcdir_dkms/"
    install -m644 dkms.conf  "$srcdir_dkms/"
    sed -i "s/@PKGVER@/$pkgver/" "$srcdir_dkms/dkms.conf"
}
