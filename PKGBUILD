# Maintainer: Michael DeGuzis <mdeguzis@gmail.com>

pkgname=mrboom-git
_basename=mrboom
pkgver=3.6.r4.g2f986e0
pkgrel=1
pkgdesc="Mr.Boom is a 8 players Bomberman clone"
arch=('i686' 'x86_64')
conflicts=('mrboom')
provides=('mrboom')
url="http://mrboom.mumblecore.org"
license=('GPL2')
makedepends=(
			 'git'
			 'sdl2'
			 'sdl2_mixer'
			)
source=('mrboom-git::git+https://github.com/libretro/mrboom-libretro'
		'mrboom.desktop'
		'mrboom.svg')
md5sums=(
		 'SKIP'
		 '780a2c3ad5ecd62870d31fd584ab2802'
		 'dcfe4201b7e8a347ee7fc4de6f90c427'
		)

pkgver() {

  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  
  cd "$srcdir/$pkgname"
  make mrboom LIBSDL2=1
  cp mrboom.out mrboom

}

package() {

  cd "$srcdir/$pkgname"

  # Install main binary
  install -Dm755 mrboom "$pkgdir"/bin/mrboom

  # Make doc dir
  mkdir -p $pkgdir/usr/share/doc/$pkgname

  # supplemental files
  install -Dm644 "$srcdir/$_basename.desktop" "$pkgdir/usr/share/applications/mrboom.desktop"
  install -Dm644 "$srcdir/$_basename.svg" "$pkgdir/usr/share/pixmaps/mrboom.svg"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname"

}
