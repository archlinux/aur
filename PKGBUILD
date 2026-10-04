# Maintainer: Ashley Bone <ashley DOT bone AT pm DOT me>
# Orginally Packaged By: Mantas Mikulėnas <grawity@gmail.com>
pkgname=rasdaemon
pkgver=1.0.0
pkgrel=1
pkgdesc="Rasdaemon is a RAS (Reliability, Availability and Serviceability) logging tool."
arch=(i686 x86_64)
url="https://github.com/mchehab/rasdaemon"
license=('GPL-2.0-or-later')
makedepends=(meson)
depends=(libtraceevent pciutils python-sqlalchemy sqlite dmidecode)
optdepends=('mariadb-libs: if MySQL/MariaDB will be used'
            'postgresql-libs: if PostgreSQL will be used'
            'python-mysqlclient: to query MySQL/MariaDB with ras-mc-ctl'
            'python-psycopg2: to query PostgreSQL with ras-mc-ctl')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3a1d70bef371e42c1b8f779791ee0a3492070ba4ba7d48450167e075570d5f4e')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    meson setup --prefix=/usr --sbindir=bin build
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
}
