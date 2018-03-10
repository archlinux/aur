pkgname=scrcpy-prebuiltserver
_appname=scrcpy
pkgver=1.0
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
sha256sums=('fda84b2fc6a60bf808f7b87f7c9a985a446bad69d4de8e63e9ce699871f8026f'
            'b573b06a6072476b85b6308e3ad189f2665ad5be4f8ca3a6b9ec81d64df20558')

package() {
  cd "scrcpy-${pkgver}"
  meson build --buildtype release --strip -Db_lto=true --prefix /usr \
    -Dprebuilt_server="../../scrcpy-server-v${pkgver}.jar"
  cd build
  ninja
  DESTDIR=${pkgdir} ninja install
}
