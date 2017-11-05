# Maintainer: Fabio Loli <loli_fabio@protonmail.com> -> https://github.com/FabioLolix
# Contributor: Maximilian Kindshofer <maximilian@kindshofer.net>

pkgname=kitty
pkgver=0.4.2
pkgrel=1
pkgdesc="A modern, hackable, featureful, OpenGL based terminal emulator"
arch=('i686' 'x86_64')
url="https://github.com/kovidgoyal/kitty"
license=('GPL3')
depends=('python3' 'glew' 'glfw-x11' 'freetype2' 'xorg-xdpyinfo' 'xsel' 'fontconfig' 'libunistring')
makedepends=('git' 'pkg-config' 'python-setuptools')
source=("https://github.com/kovidgoyal/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('a5c506d8cf13085fe589d459a8568657')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py linux-package
}

package() {
  cd "$srcdir/$pkgname-$pkgver/linux-package"
  install -d $pkgdir/usr/{bin,lib,share}
  cp -r bin/* $pkgdir/usr/bin
  cp -r share/* $pkgdir/usr/share/
  cp -r lib/* $pkgdir/usr/lib/

  install -d ${pkgdir}/usr/share/pixmaps/
  mv ${pkgdir}/usr/share/icons/hicolor/256x256/kitty.png ${pkgdir}/usr/share/pixmaps/kitty.png
  rm -R ${pkgdir}/usr/share/icons
}
