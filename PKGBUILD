# Maintainer: Dmitriy Geels <dmitriy dot geels at gmail dot com>
pkgname=python-tantivy
pkgver=0.27.0
pkgrel=1
pkgdesc='Official Python bindings for the Tantivy search engine'
arch=(x86_64 aarch64)
url="https://github.com/quickwit-oss/tantivy-py"
license=(MIT)
depends=(python glibc libgcc)
makedepends=(python-build python-installer python-wheel 'python-maturin<2.0' 'python-maturin>=1.9.3' rust)
_ref=0.27.0
_builddir=tantivy-py-0.27.0
source=("tantivy-py-0.27.0.tar.gz::https://github.com/quickwit-oss/tantivy-py/archive/refs/tags/$_ref.tar.gz")
sha256sums=('fc90d88dadd2de6fe7d0772588e0e694f158316ef872ac1abee06ed2f4b4fff4')

prepare(){
 cd "$srcdir/$_builddir"
 export CARGO_HOME="$srcdir/cargo-home"
 cargo fetch --locked
}

build(){
 cd "$srcdir/$_builddir"
 export CARGO_HOME="$srcdir/cargo-home"
 export CARGO_NET_OFFLINE=true
 export MATURIN_PEP517_ARGS="--locked --offline"
 python -m build --wheel --no-isolation
}

package(){
 cd "$srcdir/$_builddir"
 python -m installer --destdir="$pkgdir" dist/*.whl
 install -Dm644 "$srcdir/tantivy-py-0.27.0/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
