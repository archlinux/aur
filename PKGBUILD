# Binary variant maintainer: Swyter <swyterzone+aur@gmail.com>
# Original package maintainer: Tomáš Mládek < tmladek {} inventati dt org >
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=pantum_driver
pkgver="1.4.0"
pkgrel="0.1"
pkgdesc="Pantum M6200-M6500-M6550-M6600-MS6000 Series LINUX Driver V1.4.0"
arch=('x86_64' 'x86' 'i686' 'i386')
license=('proprietary')
depends=('sane' 'cups')
source=(
    "http://global.pantum.com/global/wp-content/uploads/2016/01/Pantum-M6200-M6500-M6550-M6600-MS6000-Series-LINUX-Driver-V1-4-0-tar.gz"
)

md5sums=(
    '9e9d93b83e8e78cd99f8db0a35cc422a'
)

#noextract=("aeskulap_0.2.2b1-11_amd64.deb" "libdcmtk2_3.6.0-12_amd64.deb" "libwrap0_7.6.q-25_amd64.deb")

extract_deb()
{
	ar p $1 data.tar.gz | tar zx
}

build()
{
    # extract them all under the base /usr dir inside of the source folder
    #extract_deb "aeskulap_0.2.2b1-11_amd64.deb"
    #extract_deb "libdcmtk2_3.6.0-12_amd64.deb"
    #extract_deb "libwrap0_7.6.q-25_amd64.deb"
    cd ./ADF_LinuxInstaller/Resources

    mkdir pkg
    cd ./pkg
    extract_deb "../Pantum-M6500-Series-3.0.$arch.deb"
    extract_deb "../Pantum-M6500-Series-Sane-3.7.$arch.deb"


}

package()
{
    # go into the package folder and copy the /usr into the root
    cd ${pkgdir}
    cp -r ${srcdir}/ADF_LinuxInstaller/Resources/pkg/* .

    # move this into that
    cd usr/lib
    #mv -u $arch-linux-gnu/* .
    cp -a $arch-linux-gnu/* . 
    rm -r "$arch-linux-gnu"
}

