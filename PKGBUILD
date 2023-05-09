pkgname=mruby-full
pkgver=3.2.0
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
sha256sums=('3c198e4a31d31fe8524013066fac84a67fe6cd6067d92c25a1c79089744cb608')

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