# Maintainer: Mubashshir <ahmubashshir@gmail.com>
pkgname=update-notifier
pkgver=0.7.7
pkgrel=3
pkgdesc="A simple pacman update notifier"
arch=(any)
url="https://github.com/Chrysostomus/$pkgname"
license=('MIT')
depends=('awk'
        'dunst>=1.3.2-2'
        'libnotify'
        'fakeroot')
optdepends=('yaourt: for AUR support'
        'gnome-terminal: for integration with gnome-update-notifications'
        'pamac: for graphical update actions')
makedepends=('git')
source=("git://github.com/Chrysostomus/$pkgname"
		'pamac-update.patch::https://github.com/Chrysostomus/update-notifier/pull/23/commits/2467f6f1c8e6e1e47db95ac24d1070cc8ebcd24f.patch')
md5sums=('SKIP'
         'b40a0af64008acba4efcdf00f8f2bac9')

prepare() {
	cd $pkgname
	patch -p1 -i ../pamac-update.patch
}

package () {
	cd "$srcdir"
        install -Dm755 "$srcdir/$pkgname/update-notifier" "$pkgdir/usr/bin/update-notifier"
        install -Dm755 "$srcdir/$pkgname/update-checker" "$pkgdir/usr/bin/update-checker"
        install -Dm755 "$srcdir/$pkgname/update-check" "$pkgdir/usr/bin/update-check"
        install -Dm755 "$srcdir/$pkgname/update-command" "$pkgdir/usr/bin/update-command"
        install -Dm755 "$srcdir/$pkgname/update-help" "$pkgdir/usr/bin/update-help"
}
