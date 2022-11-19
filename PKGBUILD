# Maintainer: Rod Kay <rodakay5 at gmail dot com>

pkgname=markdown
pkgver=23.0.0
pkgrel=1

pkgdesc='A markdown parser for Ada.'
url='https://github.com/AdaCore/markdown'
arch=('i686' 'x86_64')
license=('Apache')

depends=(libvss)
makedepends=('gprbuild')

source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=("89efa74f7ebc37cf0701832b4ff9d9199689194debfe871752c319e5cfb0e3e1")


build()
{
    cd "$srcdir/$pkgname-$pkgver"
    BUILD_MODE=prod make
}

package()
{
    cd "$srcdir/$pkgname-$pkgver"

    make BUILD_MODE=prod   \
         DESTDIR="$pkgdir" \
         install
    
    # Install the license.
    install -D -m644 \
       "LICENSE"     \
       "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
