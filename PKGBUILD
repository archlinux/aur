# Maintainer: schaap137 <dojo86@gmail.com>

pkgname=scdtools
pkgver=0.3.5
pkgrel=5
pkgdesc="Some tools to play with GnuPG’s smartcard daemon and OpenPGP smartcards."
arch=('x86_64')
url='https://incenp.org/dvlpt/scdtools.html'
license=('GPL3')
depends=('gnupg' 'libgcrypt>=1.6.0' 'libassuan>=2.1.0' 'libgpg-error>=1.11')
source=(https://git.incenp.org/damien/${pkgname}/releases/download/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz{,.asc})
sha512sums=('5c45948f7e6b6357aa6305c942bb388f9693908991049b2b279bbf1f27bb2de3df1b8278da30b1cc423975880890cf4533f10ca3de42c9dc88182aacc6466ced'
            'SKIP')
validpgpkeys=('4FA2082362FE73AD03B88830A8DC7067E25FBABB') # Damien Goutte-Gattat <dgouttegattat@incenp.org>

prepare() {
  cp -vf /usr/share/libtool/build-aux/config.{guess,sub} "$srcdir/$pkgname-$pkgver/config/"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:

