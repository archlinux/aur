# Maintainer: Sol Bekic <s+aur at s-ol dot nu>

pkgname="velocidrone"
pkgver=1
pkgrel=1
pkgdesc="a fast paced multi-player and single player FPV drone racing simulator"
url="https://www.velocidrone.com/"
arch=('x86_64')
license=('proprietary')
makedepends=('qt5-base' 'boost')
depends=()

OPTIONS=(!strip)

source=("git+https://github.com/patchkit-net/patchkit-launcher-qt.git"
        "debian_launcher.zip::local://Velocidrone%20Debian%20Launcher.zip"
        "velocidrone.png::https://www.velocidrone.com/img/logo.png"
        "velocidrone.desktop")
md5sums=('SKIP'
         '556d05b0af4bace44167549bec0e7542'
         'e176f8bb5bded2510b7368fcb7c99ce6'
         '85bc86aef45aa4be289fac68506330de')

build() {
  cd patchkit-launcher-qt
  export PK_LAUNCHER_BOOST_LIBDIR=/usr/lib
  qmake # CONFIG+=debug
  make
}

package() {
  install -Dm755 patchkit-launcher-qt/app/Launcher "$pkgdir"/usr/share/velocidrone/Launcher
  install -Dm644 launcher.dat                      "$pkgdir"/usr/share/velocidrone/launcher.dat
  install -Dm644 velocidrone.png                   "$pkgdir"/usr/share/icons/hicolor/48x48/apps/velocidrone.png
  install -Dm644 velocidrone.desktop               "$pkgdir"/usr/share/applications/velocidrone.desktop

  mkdir -p "$pkgdir"/usr/bin
  ln -s /usr/share/velocidrone/Launcher "$pkgdir"/usr/bin/velocidrone
}
