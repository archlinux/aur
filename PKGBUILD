# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix
# Contributor: Maximilian Kindshofer <maximilian@kindshofer.net>

pkgname=kitty
pkgver=0.8.4
pkgrel=1
pkgdesc="A modern, hackable, featureful, OpenGL based terminal emulator"
arch=('i686' 'x86_64')
url="https://github.com/kovidgoyal/kitty"
license=('GPL3')
depends=('python3' 'freetype2'  'fontconfig' 'wayland' 'libx11')
makedepends=('pkg-config' 'python-setuptools' 'libxinerama' 'libxcursor' 'libxrandr' 'libxkbcommon' 'libxkbcommon-x11' 'glfw-x11' 'wayland-protocols' 'mesa')
optdepends=('imagemagick: viewing images with icat')
provides=('kitty')
conflicts=('kitty' 'kitty-git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/kovidgoyal/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('c2108accac1ec39937261837f0216fbd')

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
  mv ${pkgdir}/usr/share/icons/hicolor/256x256/apps/kitty.png ${pkgdir}/usr/share/pixmaps/kitty.png
  rm -R ${pkgdir}/usr/share/icons
}
