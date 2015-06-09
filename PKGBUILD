# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>

pkgname=riak-erlang-client
pkgver=2.1.1
pkgrel=1
pkgdesc="Erlang interface for Riak"
arch=('any')
url="https://github.com/basho/riak-erlang-client"
source=("https://github.com/basho/riak-erlang-client/archive/$pkgver.zip")
license=('Apache')
makedepends=('rebar' 'git' 'erlang-nox')
md5sums=('3b7decdeb2e0d7bd524852243c35fabb')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package(){
  _destdir="$pkgdir"/usr/lib/erlang/lib/riakc
  mkdir -p "$_destdir"
  cd "$srcdir/$pkgname-$pkgver"
  cp -R ebin src include priv "$_destdir"
  cd deps
  for dir in $(ls -d */); do
    mkdir -p "${_destdir}/deps/${dir}"
    cp -R ${dir}/ebin "${_destdir}/deps/${dir}/"
  done
}
