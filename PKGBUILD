# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="vtm"
pkgver=0.9.99.26
pkgrel=1
pkgdesc="Terminal multiplexer with window manager and session sharing"
arch=('x86_64' 'aarch64' 'i686' 'armv7h')
url="https://github.com/directvt/${pkgname}"
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cmake>=3.8')
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
b2sums=('64ff65cb726a6c83301c5c8a522e2bec995db4f8f68c24fc16c3a4ae593fce40cb6c2540613a91a93d4d901260c40ed769e7a46dae3d4a0d9c583cf671d55208')

build() {
  cd "${srcdir}"
  cmake \
    -G 'Unix Makefiles' \
    -B "${_pkgsrc}/build" \
    -S "${_pkgsrc}" \
    -DCMAKE_BUILD_TYPE:STRING='None' \
    -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
    -Wno-dev
  cmake --build "${_pkgsrc}/build"
}

package() {
  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install "${_pkgsrc}/build"

  cd "${_pkgsrc}"
  install -Dm644 "readme.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
