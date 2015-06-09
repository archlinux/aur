# Maintainer: Tomas Jasek <tomsik68(at)gmail(dot)com>

pkgname=sdl2-vapi-git
pkgver=b8ce044
pkgrel=3
pkgdesc="SDL2 Bindings for vala language"
arch=('i686' 'x86_64')
url="https://github.com/desiderantes/sdl2_vapi"
license=('GPL')
groups=()
depends=('vala' 'sdl2')
makedepends=(git)
optdepends=('sdl2_gfx: SDL Graphic Primitives'
			'sdl2_image: A simple library to load images of various formats as SDL surfaces'
			'sdl2_mixer: A simple multi-channel audio mixer'
			'sdl2_net: A small sample cross-platform networking library'
			'sdl2_ttf: A library that allows you to use TrueType fonts in your SDL applications')
provides=(sdl2-vapi)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=('git://github.com/desiderantes/sdl2_vapi.git' 'INSTALL-path.patch')
md5sums=('SKIP' '359dad346b5091c64f7d1d155b6d3f9e')
noextract=()

build() {
  cd $srcdir/sdl2_vapi
  # patch the INSTALL file to install to directory given by an argument to the script
  patch INSTALL $srcdir/INSTALL-path.patch
}

package() {
  cd $srcdir/sdl2_vapi
  # give the INSTALL file execute permission
  chmod +x INSTALL
  ./INSTALL $pkgdir/usr/share/vala/vapi
  msg2 "This package also adds bindings for other SDL2 submodules like SDL_net, SDL_image or SDL_mixer. To use these submodules, you need to install them first - they're in optional dependencies."
}
