pkgbase=dracut-efi-manager-bin
pkgname=(dracut-efi-manager dracut-efi-manager-pacman-hook)
pkgver=0.3.0
pkgrel=3
pkgdesc="tool to build linux kernel efi images and manage boot entries"
arch=(x86_64)
url="https://github.com/ju6ge/dracut-efi-manager"
source=("https://github.com/ju6ge/dracut-efi-manager/releases/download/v$pkgver/dracut-efi-manager_v${pkgver}_x86_64-unknown-linux-musl.zip")
sha256sums=( 'a5c0dc5d692cc0b53208f736ebbb3b714440cab7e15ef845b599da0cd07b6b68' )


package_dracut-efi-manager() {
    depends=(dracut)
    mkdir -p $pkgdir/usr/bin
    install -m 755 -D $srcdir/dracut-efi-manager $pkgdir/usr/bin/
    mkdir -p $pkgdir/etc
    install -m 644 -D $startdir/dracut-efi-manager.toml $pkgdir/etc
}
package_dracut-efi-manager-pacman-hook() {
    depends=(dracut-efi-manager pacman)

    mkdir -p $pkgdir/usr/share/libalpm/hooks/
    install -m 644 -D $srcdir/target/x86_64-unknown-linux-musl/release/libalpm/*.hook $pkgdir/usr/share/libalpm/hooks/
}
