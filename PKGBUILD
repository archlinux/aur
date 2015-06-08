# Maintainer: Storm Dragon <stormdragon2976@gmail.com>

_gitname='espeakup'
pkgname="$_gitname"-git
pkgver=v0.71.117.g4d87b22
pkgrel=1
pkgdesc='allows the Speakup screen review system to use the ESpeak synthesizer'
arch=('i686' 'x86_64')
url='https://github.com/stormdragon2976/espeakup'
license=('GPL3')
depends=('speakup-utils' 'espeak')
makedepends=('git')
provides=('espeakup')
conflicts=('espeakup')
install="$pkgname".install
source=("git+http://github.com/stormdragon2976/$_gitname.git"
        'espeakup.service'
        'speakupconf.service'
        'espeakup@.service'
        'espeakup.txt'
        'speakup.conf')
sha256sums=('SKIP'
            '8d747829bd998af199d2f2e4878782d8cc33bb11920de51159362021585febbe'
            'c1e97b20bd0dc4257d4af10999c65f238ac8fe8d70dd46c3d3524bf26be17171'
            '5e9c1e2f065fdc10cd15c7704d61ba479c7e7ee352e24b904c60b8fcf8bec537'
            'b9879526368d2a258b2d0ba4b30aa12bd172e01944c91544c35321581ae2d9db'
            '4c39f77f682335dee0daf7d12013bdbd695c4740acead9c7414dd3189269472e')

pkgver() {
  cd "$srcdir/$_gitname"
  local ver="$(git describe --tags)"
  echo "${ver//-/.}"
}

build() {
  cd "$srcdir/$_gitname"
  make
}

package() {
  cd "$srcdir/$_gitname"
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -m644 -D "$srcdir/espeakup@.service" "$pkgdir/usr/lib/systemd/system/espeakup@.service"
  install -m644 -D "$srcdir/espeakup.service" "$pkgdir/usr/lib/systemd/system/espeakup.service"
  install -m644 -D "$srcdir/speakupconf.service" "$pkgdir/usr/lib/systemd/system/speakupconf.service"
  install -m644 -D "$srcdir/espeakup.txt" "$pkgdir//etc/conf.d/espeakup"
  install -m644 -D "$srcdir/speakup.conf" "$pkgdir/etc/modules-load.d/speakup.conf"
}

# vim: set ts=2 sw=2 et:
