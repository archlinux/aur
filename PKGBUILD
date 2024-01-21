# maintainer: Mehmet Akif Tasova <makiftasova@gmail.com>

pkgname=lampray
pkgver=1.3.2
pkgrel=1
pkgdesc='Linux Application Modding Platform. A native Linux mod manager.'
arch=('x86_64')
url='https://github.com/CHollingworth/Lampray'
license=('Unlicense')
depends=('curl' 'p7zip' 'pkgconf' 'sdl2' 'zenity')
makedepends=('cmake' 'ninja')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2e15a016cd332aec7acbec34fddee405f7a3d591a09f5eec9f40c8f0e4df437d')

build() {
  cd "${pkgname^}-${pkgver}"

 # Treating -Wformat-security as error prevents building
  export CFLAGS="${CFLAGS} -Wno-error=format-security"
  export CXXFLAGS="${CXXFLAGS} -Wno-error=format-security"

  cmake \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DCMAKE_MAKE_PROGRAM=ninja \
    -B ./build \
    -G Ninja \
    -S ./

  cd build

  ninja
}

package() {
  cd "${pkgname^}-${pkgver}/build"

  install -Dm 755 "${pkgname^}" "${pkgdir}/usr/bin/${pkgname}"
}
