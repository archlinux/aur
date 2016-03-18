# Maintainer: James W. Barnett <jbarnet4 at tulane dot edu>
pkgname=snap-pac
pkgver=0.2
pkgrel=1
pkgdesc="Make pacman automatically use snapper to create pre/post snapshots like openSUSE's YaST"
arch=(any)
url="https://github.com/wesbarnett/snap-pac"
license=('LGPL')
depends=(snapper)
optdepends=('grub-btrfs-git: Add snapshots to GRUB menu')
source=(${url}/archive/${pkgver}.tar.gz
        snap-pac.install)
install="snap-pac.install"
md5sums=('aba7420175d397349b092075aa299de9'
         '2903106b08569e6c917918ca0f516413')

package() {
    cd "$pkgname-$pkgver"
    install -d $pkgdir/usr/bin
    install -d $pkgdir/usr/share/libalpm/hooks
    install -D snapper-pac-pre $pkgdir/usr/bin/
    install -D snapper-pac-post $pkgdir/usr/bin/
    install -D snapper-pac-grub $pkgdir/usr/bin/
    install -D 10_snapper-pre.hook $pkgdir/usr/share/libalpm/hooks/
    install -D 10_snapper-post.hook $pkgdir/usr/share/libalpm/hooks/
    install -D 99_grub-config.hook $pkgdir/usr/share/libalpm/hooks/
    install -D LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
