# Contributor: Sapphira Armageddos <shadowkyogre.public@gmail.com>
pkgname=icebreaker
pkgver=1.2.1
pkgrel=3
pkgdesc="A clone of Jezzball that uses icebergs and penguins. (non-theme support version)"
arch=('i686' 'x86_64')
url="https://mattdm.org/icebreaker/"
license=('GPL')
depends=('sdl_mixer')
source=(
	"https://mattdm.org/$pkgname/${pkgver%.*}.x/$pkgname-$pkgver.tgz"
	icebreaker.patch
)
sha512sums=(
	'ece8fc9b8d298e8a8a6c749aa29fa735b49b98d6ef147740e292aa83faabaa52e16447385ea9cf327c54e78c081519802f50fd1d596aa6f0fed030979c003899'
	'd7e5c79ffcc5ef3018fcf8aaf4d003eea976d22f92ba04e4f802c34869f14e1b04f01c437ad6869759393c4c9d5e41c269476576df1f9f106bf79f5ed7c042da'
)

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
