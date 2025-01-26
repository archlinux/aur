# Maintainer: Andreas Born <futur[DOT]andy[AT]googlemail[DOT]com>
# Contributor: James Reed <supplantr at archlinux dot info>

_pkgname=ftw
pkgname=ftw-git
pkgver=r15.85e36d7
pkgrel=1
pkgdesc='A configurable power saving script with udev rules.'
arch=('any')
url='https://github.com/supplantr/ftw'
license=('GPL-3.0-or-later')
depends=('systemd' 'hdparm' 'iw')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
backup=('etc/conf.d/ftw')
source=("$_pkgname::git+${url}.git")
md5sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" 
}

package() {
    cd "$_pkgname"
    install -Dm755 ftw "$pkgdir/usr/bin/ftw"
    install -Dm644 ftw.rules "$pkgdir/usr/lib/udev/rules.d/99-ftw.rules"
    install -Dm644 etc-conf.d/ftw "$pkgdir/etc/conf.d/ftw"
}
