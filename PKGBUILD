# Maintainer: gardar <aur@gardar.net>
# Contributor: gardar <aur@gardar.net>
pkgname=zfsbootmenu
pkgver=2.3.0
pkgrel=2
pkgdesc="ZFS bootloader for root-on-ZFS systems"
license=('MIT')
url="https://github.com/zbm-dev/$pkgname"
arch=('x86_64')
depends=('zfs' 'kexec-tools' 'fzf' 'bash' 'mbuffer' 'ncurses' 'perl-sort-versions' 'perl-boolean' 'perl-yaml-pp' 'openssl-1.1')
optdepends=('dracut' 'mkinitcpio' 'efibootmgr' 'refind' 'syslinux' 'grub')
source=("${pkgname}-v${pkgver}.tar.gz::${url}/archive/v$pkgver.tar.gz" "fix-git-based-version-detection.patch")
sha512sums=('9b8e2d5ea258a32cd09a9382faaa21beea54f2ed825fa747f10ffe0b9f191c257b023019ec76dc882e649e8ea6fcd8e310632bba6c783228c594e3d0fee2c9c8'
            '8562a054b9252c47361dff35bd466d300b684d714c9b0957dfce51e6a419ce9db5cf269a89f5a3382d42f3a5a71f0cd040e9f05703b300ef0b9fea447ecd7743')
backup=("etc/${pkgname}/config.yaml" "etc/${pkgname}/mkinitcpio.conf" "etc/${pkgname}/dracut.conf.d/omit-drivers.conf" "etc/${pkgname}/dracut.conf.d/${pkgname}.conf")

prepare() {
    cd "$pkgname-$pkgver"
    patch -p1 < "$srcdir/fix-git-based-version-detection.patch"
}

package() {
        cd "$pkgname-$pkgver"
        make DESTDIR="$pkgdir"
        install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
