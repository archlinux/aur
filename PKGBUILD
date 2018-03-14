pkgname=scrcpy-prebuiltserver
_appname=scrcpy
pkgver=1.1
pkgrel=1
pkgdesc="Display and control of Android devices connected on USB (prebuilt server)"
arch=(x86_64)
url=https://github.com/Genymobile/scrcpy
license=(Apache)
depends=(ffmpeg sdl2 android-tools)
makedepends=(meson)
conflicts=(scrcpy)
source=("${url}/archive/v${pkgver}.tar.gz"
        "${url}/releases/download/v${pkgver}/scrcpy-server-v${pkgver}.jar")
sha256sums=('1b56caa4aad5add2c49ea436e9f26282b55a413003d0d73b029a1fbf48da0a1c'
            '14826512bf38447ec94adf3b531676ce038d19e7e06757fb4e537882b17e77b3')

package() {
  cd "scrcpy-${pkgver}"
  meson build --buildtype release --strip -Db_lto=true --prefix /usr \
    -Dprebuilt_server="../../scrcpy-server-v${pkgver}.jar"
  cd build
  ninja
  DESTDIR=${pkgdir} ninja install
}
