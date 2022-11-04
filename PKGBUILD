# maintainer: ArticExploit <artic@articexploit.xyz>
# contrutor: Arch_user (in the artix forum, https://forum.artixlinux.org/index.php/topic,4601.msg29502.html#msg29502) 
pkgname=pantum-m6200-m6500-m6550-m6600-ms6000-driver
pkgver="1.1.99"
pkgrel="1"
pkgdesc="Linux driver for Pantum printers (MS6000-M6200-M6500-M6550-M6600) V$pkgver"
arch=('x86_64' 'x86' 'i686' 'i386' 'arm' "aarch64")
license=('proprietary')
depends=('sane' 'cups')
source=(
    "https://drivers.pantum.com/userfiles/files/download/%E9%A9%B1%E5%8A%A8%E6%96%87%E4%BB%B6/2013/Pantum%20Ubuntu%20Driver%20V1_1_99-1.zip"
)

sha256sums=(
    "64767c41223cb10f86fdbce37122580b00483233143fd703fe7d225f34df85c8"
)

extract_deb()
{
	ar p $1 data.tar.xz | tar xJ
}

build()
{
    cd $srcdir/Pantum\ Ubuntu\ Driver\ V$pkgver-$pkgrel/Resources

    mkdir -p pkg
    cd ./pkg
    extract_deb "../pantum_$pkgver-"$pkgrel"_amd64.deb"
}

package()
{
    # go into the package folder and copy the /usr into the root
    cd ${pkgdir}
    cp -r "${srcdir}/Pantum Ubuntu Driver V$pkgver-$pkgrel/Resources/pkg/"* .

    # move this into that
    # rm -r ./usr/lib64
    cd usr/lib
    #mv -u $arch-linux-gnu/* .
    cp -a $arch-linux-gnu/* .
    rm -r *-linux-gnu*
}
