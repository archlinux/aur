# Maintainer: Klaus Alexander Seistrup <klaus@seistrup.dk>
# -*- sh -*-

pkgname=slrn-snapshot
_pkgname=slrn
pkgver=1.0.4.6
_prever='pre1.0.4-6'
pkgrel=1
pkgdesc='An easy-to-use, text-mode, threaded Usenet/NNTP client (newsreader)'
arch=('x86_64' 'armv7h')
url='https://jedsoft.org/'
license=('GPL')
makedepends=('uudeview')
depends=('openssl' 'slang')
provides=('slrn')
conflicts=('slrn')
backup=(etc/slrnrc)
options=('!makeflags' 'docs' 'zipman')
source=("https://jedsoft.org/snapshots/${_pkgname}-${_prever}.tar.gz")
sha256sums=(
  'baa2d41d8b55896d393352ea7bb8ca130fa7d3a4d69094a71e6db7077d0333e0'
)
sha512sums=(
  '160eb6336ab694d15fa80b6746fca00fe02665cd1be55f5693790f4f0e91568a4d3ccb4af9cbdfbce252c637f4a09f64a64139dfc9ac04b067e3af91bb6f7d5e'
)
b2sums=(
  'ec48f0897fa536d11d0bd2ab600ef048a89d88b0e399a56e28716035b91ddb4d0f6e475c5c1eee4a096c45e108a104b05a970ff0706eea0121b14cd88c5fb6d7'
)

build() {
  cd "$_pkgname-$_prever" || exit 1

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --enable-setgid-code \
    --with-slrnpull \
    --with-ssl \
    --with-uu \
    --with-uulib=/usr/lib/uudeview \
    --with-uuinc=/usr/include/uudeview \
    --enable-spoilers

  make UUDEVIEW_LIB='/usr/lib/uudeview/*.o'
}

package() {
  cd "$_pkgname-$_prever" || exit 1

  make DESTDIR="$pkgdir" install

  install -Dm0644 COPYRIGHT   "$pkgdir/licenses/$pkgname/COPYRIGHT"
  install -Dm0644 doc/slrn.rc "$pkgdir/etc/slrnrc"
}

# eof
