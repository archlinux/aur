# Maintainer: James Cherti | Contact: http://www.jamescherti.com/contact

pkgname=linux-keep-modules
pkgver=1.0.0
pkgrel=1
pkgdesc="Preserve the Linux kernel modules during and after an upgrade"
url="https://github.com/jamescherti/archlinux-linux-keep-modules"
arch=('any')
license=('MIT')
depends=(bash rsync coreutils)
install="$pkgname.install"
source=(cleanup-linux-modules.service
        linux-modules-backup.hook
        linux-modules-restore.hook
        pacman-hook-linux-modules.sh)
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

package() {
    install -d -m 0755 "$pkgdir/etc/pacman.d/hooks"

    install -Dm644 "$srcdir/linux-modules-backup.hook" \
        "$pkgdir/etc/pacman.d/hooks/linux-modules-backup.hook"

    install -Dm644 "$srcdir/linux-modules-restore.hook" \
        "$pkgdir/etc/pacman.d/hooks/linux-modules-restore.hook"

    install -Dm644 "$srcdir/cleanup-linux-modules.service" \
        "$pkgdir/etc/systemd/system/cleanup-linux-modules.service"

    install -d -m 0755 "$pkgdir/etc/pacman.d/hooks.bin"

    install -Dm755 "$srcdir/pacman-hook-linux-modules.sh" \
        "$pkgdir/etc/pacman.d/hooks.bin/pacman-hook-linux-modules.sh"
}
