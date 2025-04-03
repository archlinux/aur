# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

pkgname=rx_tools
pkgver=1.0.3
pkgrel=5
pkgdesc='Implementation of librtlsdr rtl_* tools using SoapySDR as the driver backend'
url="https://github.com/rxseger/rx_tools"
arch=('x86_64')
license=('GPL2')
depends=('soapysdr')
makedepends=('cmake')
source=("$url/archive/v$pkgver.zip"
        rx_tools-1.0.3-compilation-fixes.patch)
sha512sums=('6afc5e99061725a5cab79418ea5a912a9de73d2a5abd5932e17b1ef6b6b4c0c079fd8502dd37ce039244ba2aab692001736f371d2ef1570be6c2fb2ab30f7c72'
            'a31f47ce8b5eb4f87415f3005affd5074edd08730a7b00b998c14b60913b668e94c286b8a09f3da104206fafb760c14bafe7de727ace8ccb26b2c6e586f94a9a')

prepare(){
  cd $pkgname-$pkgver
  patch -Np1 < "${srcdir}"/rx_tools-1.0.3-compilation-fixes.patch
}

build(){
  mkdir -p $pkgname-$pkgver/build
  cd $pkgname-$pkgver/build

  CFLAGS='-Wno-conversion -Wno-int-conversion -Wno-incompatible-pointer-types' \
  CXXFLAGS='-Wno-conversion -Wno-int-conversion -Wno-incompatible-pointer-types' \
  cmake .. \
  	-DCMAKE_INSTALL_PREFIX=/usr \
	-DCMAKE_POLICY_VERSION_MINIMUM=3.5

  make
}

package()
{
    cd $pkgname-$pkgver/build

    make DESTDIR="$pkgdir" install
}
