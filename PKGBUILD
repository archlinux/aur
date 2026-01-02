# Maintainer: gardar <aur@gardar.net>
# Contributor: gardar <aur@gardar.net>
pkgname=zfsbootmenu
pkgver=3.1.0
pkgrel=1
pkgdesc="ZFS bootloader for root-on-ZFS systems"
license=('MIT')
url="https://github.com/zbm-dev/$pkgname"
arch=('x86_64')
depends=('zfs' 'kexec-tools' 'fzf' 'bash' 'mbuffer' 'ncurses' 'perl-sort-versions' 'perl-boolean' 'perl-yaml-pp' 'openssl')
optdepends=('dracut' 'mkinitcpio' 'efibootmgr' 'refind' 'syslinux' 'grub')
source=("${pkgname}-v${pkgver}.tar.gz::${url}/archive/v$pkgver.tar.gz" "99-zfsbootmenu.hook")
sha512sums=('79d2134e827e27dbcc170f47b7c8f465f64d70a1bb6ddb2f05553a0515ccdc75e857e5378fd4fb9d61f3b07d3b0be8e163bde755dd09e0f7e599ebf14c575810' '7f590461bf07c4dee551aaf280f48ebc40ab6fc0478573793777477010565dcd76c7eea6ff20460d66fce1bb6bedd3bbab068eb45ea311636b39227a81ab481f')
backup=("etc/${pkgname}/config.yaml" "etc/${pkgname}/mkinitcpio.conf" "etc/${pkgname}/dracut.conf.d/omit-drivers.conf" "etc/${pkgname}/dracut.conf.d/${pkgname}.conf")

package() {
	cd "$pkgname-$pkgver"
	make install DESTDIR="$pkgdir"
	install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "$srcdir/99-zfsbootmenu.hook" "$pkgdir/usr/share/doc/$pkgname/hooks/99-zfsbootmenu.hook"
}
