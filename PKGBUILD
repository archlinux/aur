# Maintainer: b.klettbach@gmail.com

pkgname=multimc5-git
pkgver=0.4.7
pkgrel=1
pkgdesc="Minecraft launcher with ability to manage multiple instances."
arch=('i686' 'x86_64')
url="http://multimc.org/"
license=('Apache')
depends=('qt5-base' 'qt5-x11extras' 'java-runtime' 'qt5-svg')
makedepends=('git' 'patch' 'cmake' 'qt5-tools' 'qt5-x11extras' 'java-environment')
conflicts=('multimc5')
source=("$pkgname"::"git://github.com/MultiMC/MultiMC5.git#tag=${pkgver}"
  'multimc5.sh'
  'multimc5.desktop'
)
sha512sums=('SKIP'
  '039dcb1e40eaad229dad9a71b7a858774fc689a90f352726608bb508fb482f50c6ce1fb5c77265846d36937ca60806516bf1d93aa93c44661392dd0922dd00c5'
  'a6712d0e84acc719ed1aff740717add44202f88cb42a0b7a3157108b73a1009ac7edd325f75d372e0a63617f40eb614d55fb4e24e5c1fb8957cd280486070675')



build() {
  cd "$srcdir/$pkgname"

  sed -i '/add_subdirectory(mmc_updater)/d' CMakeLists.txt
  mkdir build
  cd build
  cmake $srcdir/$pkgname
  make
}

package() {
 cd "$srcdir/$pkgname/build"
 install -D MultiMC $pkgdir/usr/lib/multimc5/MultiMC5
 install -D $srcdir/multimc5.sh $pkgdir/usr/bin/multimc5
 install -D $srcdir/$pkgname/application/resources/multimc/scalable/multimc.svg $pkgdir/usr/share/pixmaps/multimc5.svg
 install -D $srcdir/multimc5.desktop $pkgdir/usr/share/applications/multimc5.desktop
 install -D jars/NewLaunch.jar $pkgdir/usr/lib/multimc5/jars/NewLaunch.jar
 install -D jars/JavaCheck.jar $pkgdir/usr/lib/multimc5/jars/JavaCheck.jar
}
