pkgname=mruby-full
pkgver=3.1.0
pkgrel=1
pkgdesc='Mruby with full gems'
arch=(x86_64)
url='https://github.com/mruby/mruby'
license=(MIT)
depends=(readline)
makedepends=(bison ruby ruby-rake)
conflicts=(mruby)
provides=(mruby)
source=(mruby-$pkgver.tar.gz::https://github.com/mruby/mruby/archive/$pkgver.tar.gz)
sha1sums=('66ce7808e26d5c47ffb7da350aaf8e0705c1a75f')

build(){
    cd mruby-$pkgver
    sed -r -i "s:default:full-core:g" ./build_config/default.rb
    make
}

check(){
    cd mruby-$pkgver
    make test
}

package(){
    cd mruby-$pkgver
    install -d "$pkgdir/usr/bin" "$pkgdir/usr/lib" "$pkgdir/usr/share/licenses/mruby"
    cp build/host/bin/* "$pkgdir/usr/bin"
    cp build/host/lib/*.a "$pkgdir/usr/lib"
    cp -r include "$pkgdir/usr"
    cp LICENSE "$pkgdir/usr/share/licenses/mruby/LICENSE"
}