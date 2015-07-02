# Maintainer: Andrew Krasichkov <buglloc _ at _ yandex _ dot _ru>

pkgname=brick
pkgver=0.1.27.31
pkgrel=1
pkgdesc="Unofficial Bitrix24 messenger client"
arch=('i686' 'x86_64')
url="https://github.com/buglloc/brick"
license=("MIT")
depends=("alsa-lib" "desktop-file-utils" "gconf" "libxtst" "libxss" "xdg-utils" "gtk2" "libnotify" "nss")
optdepends=()
conflicts=("brick-unity" "brick-git" "brick-unity-git")
makedepends=("p7zip" "cmake")
install=${pkgname}.install
source=("https://github.com/buglloc/brick/archive/v${pkgver}.tar.gz")
source_i686=("https://github.com/buglloc/cef-builds/raw/79c6f03ac3d4eb3332d6c374d9a9cb0fa3be742b/libs/cef-i686.tar.gz")
sha256sums=("92f726ca4ea3ea25c775f990717df386bd5ee5edb7f48cae9c7b94864528ddd5")
sha256sums_i686=("134454435e24ecae8be9430cb36e2a6095f780443e2e09ac05a4e41beb85d253")


build() {
  cd ${srcdir}

  if [ $CARCH == "i686" ];
  then
    rm -f "brick-${pkgver}/Release/*"
    cp -arf cef-i686/* "brick-${pkgver}/Release"
  fi

  mkdir -p out
  cd out
  cmake -DCMAKE_INSTALL_PREFIX=${pkgdir} -DUNITY_DESKTOP=OFF "../brick-${pkgver}"
  make
}

package() {
  cd ${srcdir}/out
  make install
  install -dm755 "${pkgdir}/usr/bin"
  rm -f "${pkgdir}/usr/bin/brick"
  ln -s /opt/brick/brick "${pkgdir}/usr/bin/brick"
}
