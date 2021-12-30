# Maintainer: Kristian Gunstone <kristian.gunstone.butnotthispart@pean.northis.org>
# Contributor: Hugo Arpin ("harpin")
# Contributor: Paula Breton <paula@parashep.com>
# Contributor: robb_force <robb_force@holybuffalo.net>

pkgname=ucon64
pkgver=2.2.2
pkgrel=1
pkgdesc="A ROM backup tool and emulator's Swiss Army knife program." 
arch=('i686' 'x86_64')
url="https://ucon64.sourceforge.io/index.php"
license=('GPL')
depends=('zlib' 'libusb-compat')
optdepends=('libieee1284: libcd64 enhancements')
source=(https://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}-src.tar.gz)
sha256sums=('e100ad4a30f6c19abde98e361c6a0ecac4e40477f54cfb75498c5ccd21fb3a18')

srcroot="${pkgname}-${pkgver}-src/src"

prepare()
{
    patch -d "${srcroot}" -p2 < ../aur_discmage_path.patch
}

build() 
{
    cd "$srcroot"
    export CFLAGS="$CFLAGS -D_FORTIFY_SOURCE=2"
    ./configure --prefix=/usr --with-libusb --with-libcd64 --with-libdiscmage
    make
}

package() 
{
    cd "$srcroot"

    install -Dm775 ucon64 "${pkgdir}"/usr/bin/ucon64
    install -Dm755 libdiscmage/discmage.so "${pkgdir}"/usr/lib/discmage.so
}
