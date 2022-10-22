pkgname=pantum-m6200-m6500-m6550-m6600-ms6000-driver
pkgver="1.1.94"
pkgrel="1"
pkgdesc="Linux driver for Pantum printers (MS6000-M6200-M6500-M6550-M6600) V$pkgver"
arch=('x86_64' 'x86' 'i686' 'i386' 'arm' "aarch64")
license=('proprietary')
depends=('sane' 'cups')
source=(
    "https://drivers.pantum.com/userfiles/files/download/%E9%A9%B1%E5%8A%A8%E6%96%87%E4%BB%B6/2013/Pantum%20Linux%20Driver%20V1_1_94-1.zip"
)

sha256sums=(
    "676f1b0761e1be66511a984e4d163a67c75d05e3e31f3a6eafbc471b9e10f959"
)

extract_deb()
{
	ar p $1 data.tar.xz | tar xJ
}

build()
{
    cd $srcdir/Pantum\ Linux\ Driver\ V$pkgver-$pkgrel/Resources

    mkdir -p pkg
    cd ./pkg
    extract_deb "../pantum_$pkgver-"$pkgrel"_amd64.deb"
}

package()
{
    # go into the package folder and copy the /usr into the root
    cd ${pkgdir}
    cp -r "${srcdir}/Pantum Linux Driver V$pkgver-$pkgrel/Resources/pkg/"* .

    # move this into that
    # rm -r ./usr/lib64
    cd usr/lib
    #mv -u $arch-linux-gnu/* .
    cp -a $arch-linux-gnu/* .
    rm -r *-linux-gnu*
}