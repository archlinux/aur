pkgname=pantum_driver
pkgver="1.1.5"
pkgrel="0.1"
pkgdesc="Pantum M6200-M6500-M6550-M6600-MS6000 Series LINUX Driver V1.1.5"
arch=('x86_64' 'x86' 'i686' 'i386' 'arm' "aarch64")
license=('proprietary')
depends=('sane' 'cups')
source=(
    "https://global.pantum.com/global/wp-content/uploads/2017/03/Pantum-Ubuntu-Driver-V1-1-5.tar.gz"
)

md5sums=(
    'SKIP'
)

#noextract=("aeskulap_0.2.2b1-11_amd64.deb" "libdcmtk2_3.6.0-12_amd64.deb" "libwrap0_7.6.q-25_amd64.deb")

extract_deb()
{
	ar p $1 data.tar.xz | tar xJ
}

build()
{
    # extract them all under the base /usr dir inside of the source folder
    #extract_deb "aeskulap_0.2.2b1-11_amd64.deb"
    #extract_deb "libdcmtk2_3.6.0-12_amd64.deb"
    #extract_deb "libwrap0_7.6.q-25_amd64.deb"
    cd "./Pantum Ubuntu Driver V$pkgver/Resources"

    mkdir -p pkg
    cd ./pkg
    #extract_deb "../Pantum-M6500-Series-3.0.$arch.deb"
    extract_deb "../pantum-$pkgver-amd64.deb"


}

package()
{
    # go into the package folder and copy the /usr into the root
    cd ${pkgdir}
    cp -r "${srcdir}/Pantum Ubuntu Driver V$pkgver/Resources/pkg/"* .


    # move this into that
    rm -r usr/lib64
    cd usr/lib
    #mv -u $arch-linux-gnu/* .
    cp -a $arch-linux-gnu/* . 
    rm -r *-linux-gnu*
}

