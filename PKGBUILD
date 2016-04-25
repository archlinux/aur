# Maintainer: James W. Barnett <jbarnet4 at tulane dot edu>
pkgname=snap-pac
pkgver=0.4
pkgrel=2
pkgdesc="Make pacman automatically use snapper to create pre/post snapshots like openSUSE's YaST"
arch=(any)
url="https://github.com/wesbarnett/snap-pac"
license=('LGPL')
depends=(snapper)
optdepends=('grub-btrfs: Add snapshots to GRUB menu')
source=(${url}/archive/${pkgver}.tar.gz
        snap-pac.install)
install="snap-pac.install"
md5sums=('9d4547b99f0ef8f7c453fd73cd7c5faa'
         '149fe4be315b384549bef53042602efc')

package() {
    cd "$pkgname-$pkgver"
    install -d $pkgdir/usr/share/libalpm/hooks
    install -d $pkgdir/usr/share/libalpm/hooks.bin/snap-pac
    install -D snapper-pre $pkgdir/usr/share/libalpm/hooks.bin/snap-pac/
    install -D snapper-post $pkgdir/usr/share/libalpm/hooks.bin/snap-pac/
    install -D grub-config $pkgdir/usr/share/libalpm/hooks.bin/snap-pac/
    install -D 10_snapper-pre.hook $pkgdir/usr/share/libalpm/hooks/
    install -D 10_snapper-post.hook $pkgdir/usr/share/libalpm/hooks/
    install -D 99_grub-config.hook $pkgdir/usr/share/libalpm/hooks/
    install -D LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
