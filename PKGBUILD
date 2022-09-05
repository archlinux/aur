# Maintainer: simonsd <pkgs at simonsd dot org>

pkgname=znp-git
pkgver=0
pkgrel=1
pkgdesc="Wrap shell command in ZFS pre/post snapshots"
arch=('any')
url="https://github.com/simonsd/znp"
license=('AGPLv3')
depends=('zfs-utils')
provides=('znp' 'znpc')
conflicts=('znp')
backup=('etc/znp/znp.conf')
makedepends=('git')
source=('git+https://github.com/simonsd/znp.git')
md5sums=('SKIP')

pkgver() {
    cd $srcdir/${pkgname%-git}
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "$srcdir/${pkgname%-git}"
    install -Dm755 znp              $pkgdir/usr/bin/znp
    install -Dm755 znpc             $pkgdir/usr/bin/znpc
    install -dm700                  $pkgdir/var/log/znp
    install -Dm700 znp.conf.example $pkgdir/etc/znp/znp.conf
}

# vim:set ts=4 sw=4 et:
