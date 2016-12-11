# Maintainer: Carlos E. Garcia <carlos@cgarcia.org>
_hspkgname=fixed
pkgname=haskell-fixed
pkgver=0.2.1.1
pkgrel=1
pkgdesc="Signed 15.16 precision fixed point arithmetic"
arch=('any')
url="http://github.com/ekmett/fixed"
license=('custom:BSD3')
depends=('haskell-base-compat')
makedepends=('ghc')
install=${pkgname}.install
source=(http://hackage.haskell.org/packages/archive/${_hspkgname}/${pkgver}/${_hspkgname}-${pkgver}.tar.gz)
md5sums=('352e57267013d5c6962311ae266f4715')

build() {
  cd $_hspkgname-$pkgver
  runhaskell Setup configure -O2 \
    --enable-shared \
    --prefix=/usr \
    --docdir=/usr/share/doc/$pkgname
  runhaskell Setup build
  runhaskell Setup haddock --hyperlink-source
  runhaskell Setup register --gen-script
  runhaskell Setup unregister --gen-script
}

package() {
  cd $srcdir/$_hspkgname-$pkgver

  install -D -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
  install -D -m744 CHANGELOG.markdown $pkgdir/usr/share/$pkgname/CHANGELOG.markdown

  install -D -m744 register.sh $pkgdir/usr/share/$pkgname/register.sh
  install -D -m744 unregister.sh $pkgdir/usr/share/$pkgname/unregister.sh

  runhaskell Setup copy --destdir=$pkgdir
}

