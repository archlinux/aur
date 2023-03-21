# Maintainer: éclairevoyant
# Contributor: Michael Riegert <michael at eowyn net>
# Contributor: Alad Wenter <alad at archlinux dot info>
# Contributor: Daniel Landau <daniel+aur at landau dot fi>
# Contributor: sekret, mail=$(echo c2VrcmV0QHBvc3Rlby5zZQo= | base64 -d)
# Contributor: mmm
# Contributor: bslackr <brendan at vastactive dot com>
# Contributor: Jan "heftig" Steffens <jan dot steffens at gmail dot com>
# Contributor: Thomas Dziedzic < gostrc at gmail >

_pkgname=lightspark
pkgname="$_pkgname-git"
pkgver=0.8.6.1.r123.111064f9
pkgrel=1
pkgdesc="Open source Flash player implementation"
arch=(i686 x86_64)
url="https://lightspark.github.io"
license=(LGPL3)
depends=(boost-libs glew ffmpeg rtmpdump sdl2_mixer glibmm pango)
makedepends=(git cmake nasm llvm boost)
optdepends=('gnash-gtk: Gnash fallback support')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://github.com/lightspark/$_pkgname.git")
b2sums=('SKIP')

pkgver() {
	cd $_pkgname
	git describe --long --tags --exclude latest | sed 's/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
	cd $_pkgname
	cmake \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release \
		-DGNASH_EXE_PATH=/usr/bin/gtk-gnash .
	make
}

package() {
	make -C$_pkgname DESTDIR="$pkgdir/" install
}
