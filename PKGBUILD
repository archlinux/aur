# Contributor: Angelo Theodorou <encelo@users.sourceforge.net>
pkgname=shadermaker
pkgver=1.02
pkgrel=5
pkgdesc="A simple and cross-platform GLSL editor"
arch=('i686' 'x86_64')
url="http://cgvr.cs.uni-bremen.de/teaching/shader_maker"
license=('GPL')
depends=('qt4')
makedepends=('unzip')
changelog=shadermaker.changelog
source=(http://cgvr.cs.uni-bremen.de/teaching/shader_maker/ShaderMaker_src.zip\
        shadermaker.desktop)
md5sums=('5ec3cfb3e2335b6ccd008a54225dd603' '1af901ac4b9e6b5239770aded4a8ca46')


build() {
  cd "$srcdir"/ShaderMaker_src

  # Compiling
  cd src
  qmake-qt4 ShaderMaker.pro
  make
}

package() {
  cd "$srcdir"/ShaderMaker_src

  # Installing support files
  install -D -m755 ShaderMaker "$pkgdir"/usr/bin/ShaderMaker
  mkdir -p "$pkgdir"/usr/share/shadermaker
  cp -R models shaders textures  "$pkgdir"/usr/share/shadermaker
  chmod -x "$pkgdir"/usr/share/shadermaker/{models,shaders,textures}/*

  # Installing icon and desktop file
  install -D -m644 $srcdir/shadermaker.desktop "$pkgdir"/usr/share/applications/shadermaker.desktop
  install -D -m644 src/images/appicon.png "$pkgdir"/usr/share/pixmaps/shadermaker.png
  chmod -x "$pkgdir"/usr/share/pixmaps/shadermaker.png
}

# vim:set ts=2 sw=2 et:
