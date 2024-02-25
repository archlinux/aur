# Maintainer: Axel McLaren <scm(at)axml(dot)uk>
# Contributor: Bing-Hua Wang <louiswpf@gmail.com>
# Contributor: Michael Duell <michael.duell@rub.de> PGP Key: 5566FF77 Fingerprint: FF8C D50E 66E9 5491 F30C  B75E F32C 939C 5566 FF77
# Contributor: Juergen Hoetzel <juergen@hoetzel.info>
# Contributor: Joerie de Gram <j.de.gram@gmail.com>
# Contributor: bender02 at archlinux dot us

pkgname=aespipe
pkgver=2.4g
pkgrel=1
pkgdesc="Encrypts data from stdin to stdout"
arch=('i686' 'x86_64' 'armv7h')
url="http://loop-aes.sourceforge.net"
license=('GPL')
depends=('sharutils')
source=(http://loop-aes.sourceforge.net/${pkgname}/${pkgname}-v${pkgver}.tar.bz2{,.sign})
sha384sums=('a008e3bfb78182875d32e153971edfc25f3becc6f3c225e59123f58fcffdc2e6e694389735b0af21f1a5b87f1e06dc35'
            'SKIP')
# Please manually verify that the Signer PGP key is the correct one.
# If you are lazy and don't care about security you can enable
# the validpgpkeys line below.
#validpgpkeys=('12D64C3ADCDA0AA427BDACDFF0733C808132F189') # Jari Ruusu

build() {
  cd "$srcdir/$pkgname-v$pkgver"
  ./configure --prefix=/usr
  make
}

check() {
  cd "$srcdir/$pkgname-v$pkgver"
  make tests
}

package() {
  cd "$srcdir/$pkgname-v$pkgver"
  make prefix="$pkgdir/usr" install
  install -d -m755 "$pkgdir"/usr/{bin,share/doc/$pkgname}
  install -D -m755 bz2aespipe "$pkgdir"/usr/bin/
  install -D -m644 README ChangeLog "$pkgdir"/usr/share/doc/$pkgname/
}
