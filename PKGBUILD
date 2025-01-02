# Maintainer: Adam Perkowski <adas1per@protonmail.com>
# https://github.com/adamperkowski/PKGBUILDs

# Contributor: Behnam Momeni <sbmomeni [at the] gmail [dot] com>
# Contributor: Endo Aya <endoaya@protonmail.ch>
# Contributor: Jan de Groot <jgc@archlinux.org>

__pkgname=libxpm
_pkgname=libXpm
pkgname="lib32-$__pkgname"
pkgver=3.5.17
pkgrel=4
pkgdesc="X11 pixmap library (32-bit)"
arch=('x86_64')
license=('MIT' 'X11-distribute-modifications-variant')
url="https://xorg.freedesktop.org"
depends=('lib32-libxt' 'lib32-libxext' 'lib32-libx11' 'lib32-glibc')
makedepends=('xorg-util-macros' 'gcc-multilib' 'lib32-gcc-libs')
options=('!libtool')
source=("$url/releases/individual/lib/$_pkgname-$pkgver.tar.xz")
sha512sums=('52f9d2664a47a26c1a6ad65d18867de870b66947b0b0d99cca3512756a0aaa6ce2a245c0b49f20b70c3ce48bf04c47c333e8119a147465c277bca727f6ab017e')

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd "$_pkgname-$pkgver"

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --disable-static \
    --disable-open-zfile \
    --libdir=/usr/lib32

  make
}

package() {
  cd "$_pkgname-$pkgver"

  make DESTDIR="$pkgdir" install

  rm -rf $pkgdir/usr/{include,share,bin}

  install -Dm644 COPYING -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim: ts=2 sw=2 et:
