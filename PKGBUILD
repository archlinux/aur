# maintainer: ArticExploit <artic@articexploit.xyz>
# contributor: Arch_user (in the artix forum, https://forum.artixlinux.org/index.php/topic,4601.msg29502.html#msg29502) 
pkgname=pantum-driver
pkgver="1.1.106"
pkgrel="1"
pkgdesc="Linux driver for all M series and most P seriers Pantum printers V$pkgver"
arch=('x86_64' 'x86' 'i686' 'i386' 'arm' "aarch64")
license=('proprietary')
depends=('sane' 'cups')
source=(
    "https://drivers.pantum.com/userfiles/files/download/drive/Pantum%20Ubuntu%20Driver%20V1_1_106.zip"
)

sha256sums=(
    "21f97310cda4aaa32a390599e44bbdd3a7446bce61f8d1519a847bcbb58f5fb4"
)

extract_deb()
{
	ar p $1 data.tar.xz | tar xJ
}

build()
{
    cd $srcdir/Pantum\ Ubuntu\ Driver\ V$pkgver/Resources

    mkdir -p pkg
    cd ./pkg
    extract_deb "../pantum_$pkgver-"$pkgrel"_amd64.deb"
}

package()
{
    # go into the package folder and copy the /usr into the root
    cd ${pkgdir}
    cp -r "${srcdir}/Pantum Ubuntu Driver V$pkgver/Resources/pkg/"* .

    # move this into that
    # rm -r ./usr/lib64
    cd usr/lib
    #mv -u $arch-linux-gnu/* .
    cp -a $arch-linux-gnu/* .
    rm -r *-linux-gnu*
}
