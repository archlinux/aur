pkgname=scrcpy-prebuiltserver
_appname=scrcpy
pkgver=1.4
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
sha256sums=('35d47bfe934bfdd219d879f0f62bb15cac1b7a70c03ef9e1f123e9c2d4cdb767'
            '1ff7a72fcfe81dadccfab9d6f86c971cd7c7f38f17196748fe05480e301b443d')

package() {
  cd "scrcpy-${pkgver}"
  meson build --buildtype release --strip -Db_lto=true --prefix /usr \
    -Dprebuilt_server="../../scrcpy-server-v${pkgver}.jar"
  cd build
  ninja
  DESTDIR=${pkgdir} ninja install
}
