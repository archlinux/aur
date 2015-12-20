pkgname=tp_smapi-dkms
pkgver=0.41
pkgrel=8
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
sha256sums=('6109f2ec379e064340e8e1f3a284c4a56c765fcfd9210acd8dea308c091b95b2'
            'e2d3db8b9bd5c53cba1d702e36814ec56ef52dd37dfe8a03f58deb83c11c8bed'
            '4bcce516a9f3c486a934cfe6e3d3c92443833f4094ec008ce25264d1a5b66097')

package() 
{
    # patch Makefile for recent kernel module directory change
    patch -p1 < kbase.patch

    mkdir -p "${pkgdir}"/usr/src/${pkgname}-${pkgver}
    cp -a tp_smapi-master/{*.{h,c},Makefile} "${pkgdir}"/usr/src/${pkgname}-${pkgver}
    cp dkms.conf "${pkgdir}"/usr/src/${pkgname}-${pkgver}
    sed -i 's/KVER/KERNELRELEASE/g' "${pkgdir}"/usr/src/${pkgname}-${pkgver}/Makefile
}
