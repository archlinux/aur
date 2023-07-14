# maintainer: ArticExploit <artic@articexploit.xyz>
# contributor: Arch_user (in the artix forum, https://forum.artixlinux.org/index.php/topic,4601.msg29502.html#msg29502)
# compatible printer models:
# P2200 P2200W
# P2500 P2509 P2509W P2500W P2502 P2502W P2506
# P3010D P3010DW P3018DW P3012DW
# P3300DN P3300DW P3302DW P3302DN P3308DN P3308DW
# M6500 M6500NW M6500N M6500W M6502 M6502NW M6509 M6509NW
# M6550 M6550NW M6550N M6550W M6552NW M6558NW M6559 M6559N M6559NW
# M6600 M6600NW M6600W M6602NW M6600N M6609N M6609NW
# M6700D M6700DW M6702DW
# M6800FDW M6802FDW M6808FDW
# M7100DN M7100DW M7102DN M7102DW M7108DW
# M7200FD M7200FDN M7200FDW M7202FDN M7202FDW M7208FDW
# M7300FDN M7300FDW
# BP5100DN BP5100DW
# BM5100ADN BM5100ADW BM5100FDN BM5100FDW 
# L2710FDW

pkgname=pantum-driver
pkgver="1.1.106"
pkgrel="1"
pkgdesc="Linux driver for Pantum printers V$pkgver (check PKGBUILD for compatible printer models)"
arch=('x86_64' 'x86' 'i686' 'i386' 'arm' "aarch64")
uel="https://global.pantum.com/support/download/driver/"
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
