# Maintainer: Andrew Krasichkov <buglloc _ at _ yandex _ dot _ru>

pkgname=brick
pkgver=0.2.11.34
pkgrel=1
pkgdesc="An open source Bitrix24 messenger client"
arch=('i686' 'x86_64')
url="https://github.com/buglloc/brick"
license=("MIT")
depends=("alsa-lib" "desktop-file-utils" "gconf" "libxtst" "libxss" "xdg-utils" "gtk2" "libnotify" "nss")
optdepends=("libappindicator-gtk2: modern system indicator support for KDE5, Cinnamon, Unity, etc")
conflicts=("brick-git" "mesa-demos")
makedepends=("p7zip" "cmake")
install=${pkgname}.install
source=("https://github.com/buglloc/brick/archive/v${pkgver}.tar.gz")
sha256sums=("606d915ce0285c9d59c62863d31b45639a015796bb2e70ff54a01b54b2144cf4")
source_x86_64=("https://github.com/buglloc/cef-builds/raw/0d15971961fda87682bd5e067cdcf5450e72b6b8/libs/cef-x86_64.tar.gz")
sha256sums_x86_64=("5edf8e04ffb6acbcb88c26b3d4fcae9020d18967c9c4b9d3afa32530354e883d")
source_i686=("https://github.com/buglloc/cef-builds/raw/0d15971961fda87682bd5e067cdcf5450e72b6b8/libs/cef-i686.tar.gz")
sha256sums_i686=("8ed11e59556f77de7249804a6eb32fdf88f1236a7b22bc6acae0894564d4c2c5")
noextract=("cef-i686.tar.gz" "cef-x86_64.tar.gz")

prepare() {
  mkdir -p "brick-${pkgver}/Release/"
  tar -xzf "cef-${CARCH}.tar.gz" --directory "brick-${pkgver}/Release"
}

build() {
  cd ${srcdir}
  mkdir -p out
  cd out
  cmake -DCMAKE_INSTALL_PREFIX=${pkgdir} -DSKIP_BRICK_REGISTER=1 "../brick-${pkgver}"
  make
}

package() {
  cd ${srcdir}/out
  make install
  install -dm755 "${pkgdir}/usr/bin"
  ln -sf /opt/brick/brick "${pkgdir}/usr/bin/brick"
  ln -sf /opt/brick/bin/brick-client "${pkgdir}/usr/bin/brick-client"
}
