# Maintainer: vorpalblade77@gmail.com
# Contributor: b.klettbach@gmail.com

pkgname=multimc5
pkgver=0.4.7
pkgrel=1
pkgdesc="Minecraft launcher with ability to manage multiple instances."
arch=('i686' 'x86_64')
url="http://multimc.org/"
license=('Apache')
depends=('qt5-base' 'qt5-x11extras' 'java-runtime' 'qt5-svg')
makedepends=('git' 'cmake' 'qt5-tools' 'qt5-x11extras' 'java-environment')
optdepends=('mcedit: Allows editing of minecraft worlds')
conflicts=('multimc5-git')
source=("https://github.com/MultiMC/MultiMC5/archive/${pkgver}.tar.gz"
  'multimc5.sh'
  'multimc5.desktop'
)
sha512sums=('237b566ee6b7e6ba0800790f0ec25e3e2fd6037688fd5b3105d8f3dfe880c3d0eeb5d08969b222b45cf815e8c616aef0bc955a4ac12bf65138a88f004ea2175f'
            '039dcb1e40eaad229dad9a71b7a858774fc689a90f352726608bb508fb482f50c6ce1fb5c77265846d36937ca60806516bf1d93aa93c44661392dd0922dd00c5'
            'a6712d0e84acc719ed1aff740717add44202f88cb42a0b7a3157108b73a1009ac7edd325f75d372e0a63617f40eb614d55fb4e24e5c1fb8957cd280486070675')



build() {
  cd "$srcdir/MultiMC5-${pkgver}"

  sed -i '/add_subdirectory(mmc_updater)/d' CMakeLists.txt
  mkdir -p build
  cd build
  cmake $srcdir/MultiMC5-${pkgver}
  make
}

package() {
 cd "$srcdir/MultiMC5-${pkgver}/build"
 install -D MultiMC $pkgdir/usr/lib/multimc5/MultiMC5
 install -D $srcdir/multimc5.sh $pkgdir/usr/bin/multimc5
 install -D $srcdir/MultiMC5-${pkgver}/application/resources/multimc/scalable/multimc.svg $pkgdir/usr/share/pixmaps/multimc5.svg
 install -D $srcdir/multimc5.desktop $pkgdir/usr/share/applications/multimc5.desktop
 install -D jars/NewLaunch.jar $pkgdir/usr/lib/multimc5/jars/NewLaunch.jar
 install -D jars/JavaCheck.jar $pkgdir/usr/lib/multimc5/jars/JavaCheck.jar
}
