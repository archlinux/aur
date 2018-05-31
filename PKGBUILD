pkgname=scrcpy-prebuiltserver
_appname=scrcpy
pkgver=1.2
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
sha256sums=('d340e3a0aa1625161bc00068ffccbe291b7866729a5fff7ff859904480ec0df3'
            'cb39654ed2fda3d30ddff292806950ccc5c394375ea12b974f790c7f38f61f60')

package() {
  cd "scrcpy-${pkgver}"
  meson build --buildtype release --strip -Db_lto=true --prefix /usr \
    -Dprebuilt_server="../../scrcpy-server-v${pkgver}.jar"
  cd build
  ninja
  DESTDIR=${pkgdir} ninja install
}
