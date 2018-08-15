pkgname=scrcpy-prebuiltserver
_appname=scrcpy
pkgver=1.3
pkgrel=1
pkgdesc="Display and control your Android device connected on USB (prebuilt server)"
arch=(x86_64)
url=https://github.com/Genymobile/scrcpy
license=(Apache)
depends=(ffmpeg sdl2 android-tools)
makedepends=(meson)
conflicts=(scrcpy)
source=("${url}/archive/v${pkgver}.tar.gz"
        "${url}/releases/download/v${pkgver}/scrcpy-server-v${pkgver}.jar")
sha256sums=('e0e157341f6c052dc2e50ee6e912cf94df0bdda039759f19abb1eece37345f75'
            '0f9a5a217f33f0ed7a1498ceb3c0cccf31c53533893aa952e674c1571d2740c1')

package() {
  cd "scrcpy-${pkgver}"
  meson build --buildtype release --strip -Db_lto=true --prefix /usr \
    -Dprebuilt_server="../../scrcpy-server-v${pkgver}.jar"
  cd build
  ninja
  DESTDIR=${pkgdir} ninja install
}
