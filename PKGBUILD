# Maintainer: Ali Nabipour <alinabipour01@gmail.com>

pkgname=cutefish-kwin-plugins-git
_pkgname=cutefish-kwin-plugins
pkgver=0.8.r0.gfbcb00c
pkgrel=1
pkgdesc="CutefishOS KWin Plugins"
arch=('x86_64')
url="https://github.com/cutefishos/kwin-plugins"
license=('GPL')
groups=('cutefish-git')
depends=('kconfig' 'kdecoration' 'kguiaddons' 'kcoreaddons' 'kconfigwidgets' 'kwindowsystem'
         'kwayland' 'kwin' 'kdeclarative' 'plasma-framework' 'fishui-git')
makedepends=('extra-cmake-modules' 'ninja' 'qt5-tools' 'git')
provides=("$_pkgname")
conflicts=("$_pkgname" "deepin-kwin")
source=("git+$url.git")
sha512sums=('SKIP')

pkgver() {
  cd kwin-plugins
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd kwin-plugins

  cmake -GNinja -DCMAKE_INSTALL_PREFIX=/usr .
  ninja
}

package() {
  cd kwin-plugins
  DESTDIR="$pkgdir" ninja install
}
