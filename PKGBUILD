# Maintainer: Andreas Born <futur[DOT]andy[AT]googlemail[DOT]com>
# Contributor: James Reed <supplantr at archlinux dot info>

_pkgname=ftw
pkgname=$_pkgname-git
pkgver=20140131.15
pkgrel=1
pkgdesc='A configurable power saving script with udev rules.'
arch=('any')
url='https://github.com/supplantr/ftw'
license=('GPL3')
depends=('udev' 'hdparm' 'iw')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
backup=('etc/conf.d/ftw')
source=("$_pkgname::git://github.com/supplantr/ftw.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    echo "$(git log -1 --format="%cd" --date=short | sed 's|-||g').$(git rev-list --count master)"
}

package() {
    cd "$srcdir/$_pkgname"
    install -Dm755 ftw "$pkgdir/usr/bin/ftw"
    install -Dm644 ftw.rules "$pkgdir/usr/lib/udev/rules.d/99-ftw.rules"
    install -Dm644 etc-conf.d/ftw "$pkgdir/etc/conf.d/ftw"
}
