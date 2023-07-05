# Maintainer:
# Contributor: Clayton Craft <clayton@craftyguy.net>

_pkgname='terminate'
pkgname="$_pkgname"
pkgver=0.5
pkgrel=1
pkgdesc='Minimal terminal emulator based on VTE'
arch=('x86_64')
url='https://git.sr.ht/~craftyguy/terminate'
license=('GPL3')

depends=(
  'vte3'
)
makedepends=(
  'gcc'
  'meson'
  'ninja'
  'scdoc'
)

backup=("etc/terminate/config")

if [ x"$_pkgname" == x"$pkgname" ] ; then
  _pkgsrc="$_pkgname-$pkgver"

  source=(
    "$_pkgname-$pkgver.tar.gz"::"https://git.sr.ht/~craftyguy/${pkgname}/archive/${pkgver}.tar.gz"
  )
  sha256sums=(
    'e97a9cc4ee38b04fc178275154f46d6071f3f1dad081185c21503d4ef59d7aa8'
  )
fi

build() {
  cd "$srcdir/$_pkgsrc"
  meson --prefix='/usr' build
  meson compile -C build
}

package() {
  cd "$srcdir/$_pkgsrc"
  DESTDIR="$pkgdir" meson install -C build

  install -vDm0644 config -t "$pkgdir/etc/$pkgname"
  install -vDm0644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -vDm0644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
