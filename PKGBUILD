# Maintainer: Jesse R Codling <codling@umich.edu>
# Contributor: Matt Pallisard <matt@pallissard.net>

pkgname=kafs
_pkgname=kafs
pkgver=0.5
pkgrel=1
license=("GPL2")
pkgdesc="kafs client tools"
makedepends=("gcc" "git" "krb5" "openssl")
arch=("i686" "x86_64")
url="https://www.infradead.org/~dhowells/kafs/"
source=(
        "${pkgname%-*}::git://git.infradead.org/users/dhowells/kafs-client.git#tag=v${pkgver}"
        "cellservdb.conf::https://github.com/auristor/sro-auristor-client/raw/main/examples/volumeMaps/cellservdb.conf"
        )
#pulled in a more up-to-date cell database from Auristor
sha256sums=('SKIP'
            '484e096c814f3e9120cb6c55f9ff235b6523270dc1900806c91766d3218f9d72')
provides=("kafs")
conflicts=("kafs")


build() {
        cd "${srcdir}/${_pkgname}"
        make DESTDIR="$pkgdir" LIBDIR=/usr/lib SBINDIR=/usr/bin DATADIR=/usr/share/kafs all 
}

package() {
        cd "${srcdir}/${_pkgname}"
        mv ${srcdir}/cellservdb.conf conf/cellservdb.conf # copy in a recent cell database
        make DESTDIR="$pkgdir" LIBDIR=/usr/lib SBINDIR=/usr/bin DATADIR=/usr/share/kafs install
}
