# Contributor: Sapphira Armageddos <shadowkyogre.public@gmail.com>
pkgname=icebreaker
pkgver=1.2.1
pkgrel=3
pkgdesc="A clone of Jezzball that uses icebergs and penguins. (non-theme support version)"
arch=('i686' 'x86_64')
url="http://mattdm.org/icebreaker/"
license=('GPL')
depends=('sdl_mixer')
source=(http://mattdm.org/$pkgname/1.2.x/$pkgname-$pkgver.tgz icebreaker.patch)
md5sums=('9453119cf3342a8828e4805c0c49be50'
         '8c7799878c1ba5fcceeade8a60246a41')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -Np1 -i ../icebreaker.patch  || return 1
  make clean
  make highscoredir=/var/lib/games prefix=/usr || return 1
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make prefix="$pkgdir/usr" install "highscoredir=$pkgdir/var/lib/games" || return 1
}

# vim:set ts=2 sw=2 et:
