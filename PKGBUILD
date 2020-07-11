# Maintainer: Pavel Horniak <gouster4@gmail.com>
pkgname=xperia-flashtool-git
pkgver=master
pkgrel=1
pkgdesc='A S1 protocol flashing software for Sony Xperia phones'
arch=('x86_64')
license=('GPL3')
url="http://www.flashtool.net/"
depends=('libselinux' 'libsystemd' 'glib2' 'mono')
makedepends=('p7zip' 'ant')
source=(git://github.com/Androxyde/Flashtool)
md5sums=('SKIP')

build() {
   cd "$srcdir"/Flashtool
   mkdir ./bin
   ant -buildfile ant/deploy-release.xml
}

package(){
  # Moving everything to pkg/.
  mkdir "$pkgdir"/usr "$pkgdir"/usr/lib "$pkgdir"/usr/bin
  mv "$srcdir"/Deploy/FlashTool "$pkgdir"/usr/lib/FlashTool
  ln -s /usr/lib/jvm/default "$pkgdir"/usr/lib/FlashTool/x10flasher_native/jre
  ln -s "$pkgdir"/usr/lib/FlashTool/FlashTool "$pkgdir"/usr/bin/flashtool
}

