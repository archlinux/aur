# Maintainer: Timothy Rice <t.rice@ms.unimelb.edu.au>

pkgname=datamash
pkgver=1.1.1
pkgrel=1
pkgdesc="A command-line program which performs numeric, textual and statistical operations on plain text data."
arch=('i686' 'x86_64')
url="https://www.gnu.org/software/datamash/"
license=("GPL")
depends=('glibc')
source=("http://ftp.gnu.org/gnu/${pkgname}/${pkgname}-${pkgver}.tar.gz")

build() {
    cd "$pkgname-$pkgver"
    ./configure --prefix=/usr
    make
}

check() {
    cd "$pkgname-$pkgver"
    make check
}

md5sums=('cb917de6a108e20b31aa817cd76463a8')
mk_srcinfo() {
    printf "pkgbase = %s\n" "$pkgname"
    printf "\tpkgdesc = %s\n" "$pkgdesc"
    printf "\tpkgver = %s\n" "$pkgver"
    printf "\tpkgrel = %s\n" "$pkgrel"
    printf "\turl = %s\n" "$url"
    printf "\tarch = %s\n" ${arch[@]}
    printf "\tlicense = %s\n" ${license[@]}
    printf "\tdepends = %s\n" ${depends[@]}
    printf "\tsource = %s\n" ${source[@]}
    printf "\tmd5sums = %s\n" ${md5sums[@]}
    printf "\n"
    printf "pkgname = %s\n" "$pkgname"
}

package() {
    echo -n "Generating .SRCINFO ... "
    mk_srcinfo > ../.SRCINFO
    echo "Done."
    cd "$pkgname-$pkgver/"
    make DESTDIR="$pkgdir/" install
}
