# Maintainer: William Grieshaber <me@zee.li>
# Contributor: Michal Kowalski <kowalski TOD michal TA gmail TOD com>

pkgname=achilles
pkgver=2_8
pkgrel=6
pkgdesc="An artificial life and evolution simulator that uses Hebbian neural networks and OpenGL/SDL to simulate life in a simplified environment. It is based on Larry Yaeger's PolyWorld idea"
arch=('i686' 'x86_64')
# originally there, still has 1st version's tarball, do not remove
#url="http://achilles.sourceforge.net/"
url="http://packages.debian.org/achilles"
# resolves to
#url="http://packages.debian.org/search?keywords=achilles"
# really but looks better in -Qi and should be the stable one
license=('GPL2')
depends=('glu' 'libgl' 'libpng' 'sdl' 'zlib')
backup=()
options=()
install=
changelog=
# see url comment above...
#source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
source=(http://ftp.debian.org/debian/pool/main/a/$pkgname/${pkgname}_${pkgver//_8/}.orig.tar.gz
        http://ftp.debian.org/debian/pool/main/a/$pkgname/${pkgname}_${pkgver//_/-}.diff.gz)
sha512sums=('3be21d55aea094fa32536348d29f5fe45f9681d1ee2627d146c8595303d70219a38946435b0f83446ff039d5133a5efc946749378c86c0cc93091c0ebaaa1185'
            '17d6ba000f8f7034b2eb0adebd3fe013f2cbb74b2034e79be94adf463192d5b7a55f18b168858c2c3c559f7d7615097ee98baae1e8addb107bea892884487074')
noextract=()

build() {
  cd "$srcdir/$pkgname-${pkgver//_8/}"

  gunzip -c ../${pkgname}_${pkgver//_/-}.diff.gz | patch -p1
  ./configure --prefix=/usr
  make CXXFLAGS='-I/usr/include/SDL'
}

package() {
  cd "$srcdir/$pkgname-${pkgver//_8/}"

  make DESTDIR="$pkgdir/" install
  for d in usr/share/{doc/$pkgname-${pkgver//_8/},pixmaps,applications,man/man1} ; do
	install -m755 -d $pkgdir/$d ;
  done
  install -m644 debian/$pkgname.1 $pkgdir/usr/share/man/man1
  install -m644 debian/$pkgname.desktop $pkgdir/usr/share/applications
  install -m644 debian/$pkgname.svg $pkgdir/usr/share/pixmaps
  install -m644 -t $pkgdir/usr/share/doc/$pkgname-${pkgver//_8/} README NEWS ChangeLog AUTHORS
}

# vim:set ts=2 sw=2 et:
