pkgname=lib32-orbit2
pkgver=2.14.19
_commit=144be2e9860286c83f009e7689250e0af977cc5e
pkgrel=7
pkgdesc="Thin/fast CORBA ORB (32 bit)"
arch=('x86_64')
url="http://www.gnome.org"
license=('LGPL' 'GPL')
depends=('orbit2' 'lib32-libidl2')
makedepends=('gcc-multilib' 'gtk-doc' 'gnome-common')
options=('!libtool' '!makeflags')
source=("https://gitlab.gnome.org/GNOME/orbit2/-/archive/$_commit/orbit2-$_commit.tar.bz2")
sha256sums=('SKIP')

prepare() {
  cd "orbit2-$_commit"
  ./autogen.sh --prefix=/usr --disable-static --enable-gtk-doc \
  --enable-shared CC='gcc' CFLAGS='-m32' PKG_CONFIG_PATH='/usr/lib32/pkgconfig/' \
  -libdir=/usr/lib32 --libexecdir=/usr/lib32 \
  --with-idl-compiler=/usr/bin/orbit-idl-2
}

build() {
  cd "orbit2-$_commit"
  make
}

package() {
  cd "orbit2-$_commit"
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{bin,include,share}
}
