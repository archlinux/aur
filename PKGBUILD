# Maintainer: Alesh Slovak <aleshslovak@gmail.com>

pkgname=frzr
pkgver=0.15.2
pkgrel=1
pkgdesc="A deployment and update system for read-only btrfs subvolume based operating systems"
arch=('any')
url="https://github.com/gamer-os/frzr"
license=('MIT')
depends=('btrfs-progs' 'parted' 'libnewt' 'dosfstools' 'jq' 'util-linux')
optdepends=(
    'dracut: generate initramfs for kernels installed via frzr kernel command'
)
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/gamer-os/frzr/archive/$pkgver.tar.gz"
    "99-frzr-kernel-install.hook"
)
md5sums=('b4a5bb450c2b32d37742d598c20b12f0'
         '6bc04b77f135f2bf7d07c2f8c0ffaca0')

package() {
    mkdir -p "$pkgdir/usr/bin"
    mkdir -p "$pkgdir/usr/lib/frzr"
    mkdir -p "$pkgdir/usr/lib/systemd/system"
    mkdir -p "$pkgdir/usr/share/libalpm/hooks"
    install -m 755 "$srcdir/frzr-$pkgver/frzr" "$pkgdir/usr/bin"
    install -m 755 "$srcdir/frzr-$pkgver/__frzr" "$pkgdir/usr/bin"
    install -m 755 "$srcdir/frzr-$pkgver/frzr-deploy" "$pkgdir/usr/bin"
    install -m 755 "$srcdir/frzr-$pkgver/__frzr-deploy" "$pkgdir/usr/bin"
    install -m 755 "$srcdir/frzr-$pkgver/frzr-unlock" "$pkgdir/usr/bin"
    install -m 755 "$srcdir/frzr-$pkgver/__frzr-unlock" "$pkgdir/usr/bin"
    install -m 755 "$srcdir/frzr-$pkgver/frzr-bootloader" "$pkgdir/usr/bin"
    install -m 755 "$srcdir/frzr-$pkgver/__frzr-bootloader" "$pkgdir/usr/bin"
    install -m 755 "$srcdir/frzr-$pkgver/frzr-kernel" "$pkgdir/usr/bin"
    install -m 755 "$srcdir/frzr-$pkgver/__frzr-kernel" "$pkgdir/usr/bin"
    install -m 755 "$srcdir/frzr-$pkgver/frzr-version" "$pkgdir/usr/bin"
    install -m 755 "$srcdir/frzr-$pkgver/__frzr-version" "$pkgdir/usr/bin"
    install -m 755 "$srcdir/frzr-$pkgver/frzr-bootstrap" "$pkgdir/usr/bin"
    install -m 755 "$srcdir/frzr-$pkgver/__frzr-bootstrap" "$pkgdir/usr/bin"
    install -m 755 "$srcdir/frzr-$pkgver/__frzr-envars" "$pkgdir/usr/bin"
    install -m 755 "$srcdir/frzr-$pkgver/frzr-source" "$pkgdir/usr/bin"
    install -m 755 "$srcdir/frzr-$pkgver/frzr-extras" "$pkgdir/usr/bin"
    install -m 755 "$srcdir/frzr-$pkgver/frzr-release" "$pkgdir/usr/bin"
    #install -m 644 "$srcdir/frzr-$pkgver/mkinitcpio.conf" "$pkgdir/usr/lib/frzr"
    install -m 644 "$srcdir/frzr-$pkgver/frzr-autoupdate.service" "$pkgdir/usr/lib/systemd/system"
    install -m 644 "$srcdir/frzr-$pkgver/frzr-autoupdate.timer" "$pkgdir/usr/lib/systemd/system"
    install -m 644 "$srcdir/99-frzr-kernel-install.hook" "$pkgdir/usr/share/libalpm/hooks"

    echo 'g frzr 379 - -' | install -Dm644 /dev/stdin "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
}
