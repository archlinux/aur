pkgname=scrcpy-prebuiltserver
_appname=scrcpy
pkgver=1.8
pkgrel=1
pkgdesc="Display and control your Android device connected on USB (prebuilt server)"
arch=(x86_64)
url=https://github.com/Genymobile/scrcpy
license=(Apache)
provides=(scrcpy)
depends=(ffmpeg sdl2 android-tools)
makedepends=(meson)
conflicts=(scrcpy)
source=("${url}/archive/v${pkgver}.tar.gz"
        "${url}/releases/download/v${pkgver}/scrcpy-server-v${pkgver}.jar")
sha256sums=('1d4b53573554a60fa46b6b40685dbe6c8474bc451ecbe803e2f2ec9724b48a01'
            '839055ef905903bf98ead1b9b8a127fe402b39ad657a81f9a914b2dbcb2ce5c0')

install='scrcpy-prebuiltserver.install'

package() {
  cd "scrcpy-${pkgver}"
  meson build --buildtype release --strip -Db_lto=true --prefix /usr \
    -Dprebuilt_server="../../scrcpy-server-v${pkgver}.jar"
  cd build
  ninja
  DESTDIR=${pkgdir} ninja install
}
