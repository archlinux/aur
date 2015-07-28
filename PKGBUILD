# Contributor: Chris Allison <chris.allison@hotmail.com>

pkgbase=python2-dvbstreamer
pkgname=pydvbstreamer
project=dvbstreamer
pkgver=0.1
pkgrel=2
pkgdesc="python control modules for dvbstreamer (https://aur4.archlinux.org/packages/dvbstreamer/)"
arch=("any")
url="http://sourceforge.net/projects/${project}/"
license=("GPLv2")
makedepends=("python2-setuptools")

source=("http://downloads.sourceforge.net/project/${project}/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.bz2"
       "https://raw.githubusercontent.com/ccdale/dvbstreamer-patches/master/pydvbstreamer-event-end.patch")
sha256sums=('33e23f0f9305e12f27bebae585a494340e4d5b152c0512d9bbe2201a08a7b5e5'
            '4635265ac50ccf51034e4fb17ad07d068ab4c52178b61aedab4ab641b142d0ca')

prepare()
{
    patchfile=`pwd`/../../pydvbstreamer-event-end.patch
    rm -rf ${pkgname}-${pkgver}/build
    pushd ${pkgname}-${pkgver}/src/dvbstreamer
    patch <$patchfile
    popd
}
package()
{
    cd ${pkgname}-${pkgver}
    python2 setup.py install --root="$pkgdir/" --optimize=1
}
