pkgname=tp_smapi-dkms
pkgver=0.41
pkgrel=7
pkgdesc="DKMS controlled modules for ThinkPad's SMAPI functionality"
arch=(any)
url="http://www.thinkwiki.org/wiki/Tp_smapi"
license=('GPL')
depends=('dkms')
conflicts=('tp_smapi')
provides=("tp_smapi=${pkgver%.*}")
options=(!strip)
install='tp_smapi-dkms.install'
source=('https://github.com/x539/tp_smapi/archive/master.tar.gz' 'dkms.conf' 'kbase.patch')
md5sums=('b1b42fdd181d5cb3306eacbedda7845f'
         '348a6bda27ecd69112417fbda8d7a2ee'
         '933c95f6a6ff187d7dd0bcf413b30b8e')

package() 
{
    # patch Makefile for recent kernel module directory change
    patch -p1 < kbase.patch

    mkdir -p "${pkgdir}"/usr/src/${pkgname}-${pkgver}
    cp -a tp_smapi-master/{*.{h,c},Makefile} "${pkgdir}"/usr/src/${pkgname}-${pkgver}
    cp dkms.conf "${pkgdir}"/usr/src/${pkgname}-${pkgver}
    sed -i 's/KVER/KERNELRELEASE/g' "${pkgdir}"/usr/src/${pkgname}-${pkgver}/Makefile
}
