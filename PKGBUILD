# Maintainer: Heiko Baums <heiko@baums-on-web.de>
# Contributor: dibblethewrecker dibblethewrecker.at.jiwe.dot.org

pkgname=miscsplashutils
pkgver=0.1.8
pkgrel=5
pkgdesc='Miscellaneous framebuffer utilities including fbres and fbtruetype'
arch=('i686' 'x86_64')
url='http://dev.gentoo.org/~spock/projects/gensplash/'
license=('GPL')
depends=('freetype2')
source=("http://distfiles.gentoo.org/distfiles/${pkgname}-${pkgver}.tar.bz2" 
	'miscsplashutils-freetype-fix.patch')
md5sums=('0a9505c5c5ed169e6158d2c1b06ff40b'
         '05285f0a2b42e206e20e2973e69bd4c8')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  #Fix for static freetype and /usr/bin directory corrections.
  patch -p1 -i "${srcdir}/miscsplashutils-freetype-fix.patch"

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/usr" install

  install -d "$pkgdir/usr/lib/splash/bin"
  ln -s /usr/bin/wc "$pkgdir/usr/lib/splash/bin"

  # install luxisri.ttf to avoid an x-server dependency
  install -D -m644 fbtruetype/luxisri.ttf "$pkgdir/etc/splash/luxisri.ttf"
}
