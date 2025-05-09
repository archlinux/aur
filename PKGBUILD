# Maintainer: Mildred Ki'Lya <mildred-in.aur@mildred.fr>
pkgname=darkradiant-git
pkgrel=1
pkgdesc="Editor for The Dark Mod and Doom 3 (idTech4) based games"
makedepends=(cmake)
depends=(wxwidgets-gtk3 ftgl glew freealut libvorbis python libsigc++ eigen)
conflicts=(darkradiant)
provides=(darkradiant)
arch=(x86_64)
url=http://www.darkradiant.net
license=(GPL LGPL BSD)
pkgver=3.9.0.r90.g0b4499d7b
source=("DarkRadiant::git+https://github.com/codereader/DarkRadiant.git")
sha512sums=(SKIP)

pkgver(){
  cd "$srcdir/DarkRadiant"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare(){
  cd "$srcdir/DarkRadiant"
  git submodule update --init --recursive
  CMAKE_POLICY_VERSION_MINIMUM=3.5 cmake .
}

build(){
  cd "$srcdir/DarkRadiant"
  make
}

package(){
  cd "$srcdir/DarkRadiant"
  make DESTDIR="$pkgdir" install
}
