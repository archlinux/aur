# Maintainer: Robert Tari <robert at tari dot in>

pkgname=cmake-extras
pkgver='1.5'
pkgrel='1'
pkgdesc='Extra CMake utility modules'
arch=('any')
url='https://launchpad.net/cmake-extras'
license=('LGPL3')
depends=('cmake>=3.1' 'python')
makedepends=('cmake')
source=("${pkgname}::http://archive.ubuntu.com/ubuntu/pool/universe/c/${pkgname}/${pkgname}_${pkgver}.orig.tar.gz" '1002_fix-googletest-1_8_1-1.patch' '1003_fix-googletests_1_9.patch' '1004_switch-to-python3.patch')
sha256sums=('4287a57b7a8f7e83b3b1b380e7a9c5d9641399925d7f77cee4b2dbced3862af8' '9d06f076e038f4ecf9d467db1e9ee72a14ee7c6828263b439d436ab4131a3967' '82ed55f5360bb266398a8085fa41ebf6f9e2fe8e853f1b9ecf2eba0163034828' '7e93c6c6c54d0d19a98fd08a4472d83e157c4e1b2e83faf966b6d1fcf14b31b3')

prepare()
{
    cd ${srcdir}/${pkgname}-${pkgver}

    patch -Np1 -i "../1002_fix-googletest-1_8_1-1.patch"
    patch -Np1 -i "../1003_fix-googletests_1_9.patch"
    patch -Np1 -i "../1004_switch-to-python3.patch"
}

build()
{
    cd ${srcdir}/${pkgname}-${pkgver}
    cmake -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package()
{
    cd ${srcdir}/${pkgname}-${pkgver}
    make DESTDIR="${pkgdir}" install
}
