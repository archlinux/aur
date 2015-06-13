# Maintainer: Ben Widawsky <ben@bwidawsk.net>
# Contributor: languiar <languitar at semipol dot de>

pkgname=threadpool
pkgver=0.2.5
_threadpoolver=0_2_5
pkgrel=1
pkgdesc="a cross-platform C++ thread pool library"
arch=('any')
url=http://threadpool.sourceforge.net/
license=('custom')
depends=('boost')
source=("http://downloads.sourceforge.net/threadpool/threadpool-${_threadpoolver}-src.zip"
        "fix_pool_schedule.patch")
sha256sums=('ab5a78d0f6ed7bd258a6095b3ba1854b40932e0e655fa492607bd2a940898889'
            '54c939715de85434326ad2388af025164c566942a564bea85cc66d313c18d3bb')

prepare() {
  cd "$srcdir/threadpool-${_threadpoolver}-src/threadpool"
  patch -Np2 -i $srcdir/fix_pool_schedule.patch
}

package() {
  cd "$srcdir/threadpool-${_threadpoolver}-src/threadpool"
  install -d "$pkgdir/usr/include/boost"
  cp -rT boost/ $pkgdir/usr/include/boost/
  install -Dm644 "LICENSE_1_0.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

