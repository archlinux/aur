# Maintainer: Dimitri Sabadie <dimitri.sabadie@gmail.com>

_hspkgname=al
pkgname=haskell-al
pkgver=0.1.3.2
pkgrel=1
pkgdesc='OpenAL haskell raw API'
arch=('any')
url=https://hackage.haskell.org/package/$_hspkgname
license=('custom:BSD3')
depends=('openal<1.17' 'haskell-mtl>=2.1' 'haskell-mtl<2.3')
makedepends=('ghc<7.11')
install=$pkgname.install
source=("http://hackage.haskell.org/package/$_hspkgname-$pkgver/$_hspkgname-$pkgver.tar.gz")
md5sums=('2a68d1fa2afb93c9d37a3d324226f00a')

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
  install -D -m744 CHANGELOG.md $pkgdir/usr/share/$pkgname/CHANGELOG.md

  install -D -m744 register.sh $pkgdir/usr/share/$pkgname/register.sh
  install -D -m744 unregister.sh $pkgdir/usr/share/$pkgname/unregister.sh

  runhaskell Setup copy --destdir=$pkgdir
}
