# Maintainer: Michael Gruz <michael.gruz@gmail.com>

pkgname=curaengine-5
_pkgname=curaengine
pkgver=5.3.1
pkgrel=1
pkgdesc="Engine for processing 3D models into 3D printing instruction for Ultimaker and other GCode based 3D printers."
url="https://github.com/Ultimaker/CuraEngine"
arch=('x86_64')
license=('AGPL')
depends=('libarcus5' 'polyclipping')
checkdepends=('cppunit')
makedepends=( 'boost'
              'cmake'
              'git'
              'gtest'
              'protobuf'
              'range-v3'
              'rapidjson'
              'stb')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Ultimaker/${_pkgname}/archive/${pkgver}.tar.gz"
        "cmake.patch"
        "cmake-helper.patch"
        "lib-stb.patch")

sha512sums=('a9148db06df08afaf95923aa9026a7645d32880d51a3579b66aa14ef44d881ac89fd0a7a12320f5c89718040e4c72ebc461b6769b9ccbf07639b8f3213c46fb1'
            '14c4c01021e2c9d85a9d1c55a86903591554537e7c45c17a502cba40f159304c2c608501ebbedae3890f57c004680384b425875d047c9534e1ba1d911cf7c096'
            '3102f984decaa84174a8757baeda61eec11fa0ca7481e530f0370d31fa7728c8a4293b0e3d25f7472c0e145b6c2e3cda6850bc4b691e4d118a235d022cbe8da7'
            'c49a4743856557f2edbda70402460cac4921b75786bea8156472104a4d3f50bc52f4b84787953231ff50a5b07b907b46fc2fc8e2318fb2773ae88e0b41bf0e1f')


prepare() {
  cd ${srcdir}/CuraEngine-${pkgver}
  patch -Np0 < ${srcdir}/cmake.patch
  patch -Np0 < ${srcdir}/cmake-helper.patch
  patch -Np0 < ${srcdir}/lib-stb.patch
}

build() {
  cd ${srcdir}/CuraEngine-${pkgver}
	cmake -G Ninja -B build \
    -DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release
	cmake --build build
}

package() {
  cd ${srcdir}/CuraEngine-${pkgver}
  DESTDIR="$pkgdir" cmake --install build
}

# vim:set ts=2 sw=2 et:
