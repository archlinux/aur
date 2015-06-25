_pkgname=backupninja
pkgname=$_pkgname-git
pkgver=1.0.1.r59.g41c3544
pkgrel=1
pkgdesc="A centralized way to configure and schedule many different backup utilities"
arch=('any')
url="https://labs.riseup.net/code/projects/backupninja"
license=('GPL')
depends=('bash')
makedepends=('git')
optdepends=('rdiff-backup: rdiff backups' 'gzip' 'hwinfo' 'duplicity: duplicity
backups')
source=('git+https://labs.riseup.net/code/backupninja.git')
md5sums=('SKIP')
pkgver() {
    cd $_pkgname
    git describe --long | sed 's/^backupninja-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/$_pkgname"
    ./autogen.sh
    ./configure --prefix=/usr --sbindir=/usr/bin --sysconfdir=/etc --mandir=/usr/share/man
    make
}

package() {
    cd "$srcdir/$_pkgname"
    make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
