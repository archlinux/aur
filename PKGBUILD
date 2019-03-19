# Maintainer: Lin Ruoshui <lin dot ruohshoei+archlinux at gmail dot com>
# Contributor: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
# Contributor:  VirtualTam <virtualtam@flibidi.net>
# Contributor: Eugene Yudin aka Infy <Eugene dot Yudin at gmail dot com>

pkgname=goldendict-qt5-git
pkgver=1.5.0.RC2.363.g6efb5210
pkgrel=1
pkgdesc="Feature-rich dictionary lookup program"
arch=('x86_64')
url="http://goldendict.org/"
license=('GPL3')
depends=('ffmpeg' 'hunspell' 'libao' 'qt5-multimedia' 'qt5-svg' 
'qt5-tools' 'qt5-webkit' 'qt5-x11extras' 'opencc' 'libeb')
makedepends=('git') 
conflicts=('goldendict')
provides=('stardict')
replaces=('goldendict')
_gitname="goldendict"
source=("git+https://github.com/goldendict/goldendict.git")
sha256sums=(SKIP)

pkgver() {
  cd ${_gitname}
  git describe --long --tags | sed 's|-|.|g'
}

build(){
  cd ${_gitname}
  # add zim and opencc support for default. 
  PREFIX="/usr" qmake-qt5 "CONFIG+=zim_support" "CONFIG+=chinese_conversion_support"
  make
}

package() {
  cd ${_gitname}
  make INSTALL_ROOT="${pkgdir}" install
}
# vim:set ts=2 sw=2 et:
