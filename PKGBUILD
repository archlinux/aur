pkgname=scrcpy-prebuiltserver
_appname=scrcpy
pkgver=1.5
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
sha256sums=('9eef28d352d064320b8a2b9cc1000d478fb617a99807f2456a54af855b39ecf9'
            'c827f566172a5c5946e63b8378ac93d374dff9e229083e5cd9980df57536947b')

package() {
  cd "scrcpy-${pkgver}"
  meson build --buildtype release --strip -Db_lto=true --prefix /usr \
    -Dprebuilt_server="../../scrcpy-server-v${pkgver}.jar"
  cd build
  ninja
  DESTDIR=${pkgdir} ninja install
}
