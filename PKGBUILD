# Maintainer: Dmitriy Geels <dmitriy dot geels at gmail dot com>
pkgname=python-tantivy
pkgver=0.27.0
pkgrel=3
pkgdesc='Official Python bindings for the Tantivy search engine'
arch=(x86_64 aarch64)
url="https://github.com/quickwit-oss/tantivy-py"
license=(MIT)
depends=('python>=3.11' glibc libgcc)
makedepends=(python-installer)
_release="https://github.com/quickwit-oss/tantivy-py/releases/download/$pkgver"
_wheel="tantivy-$pkgver-cp311-abi3-manylinux_2_17_${CARCH}.manylinux2014_${CARCH}.whl"
source_x86_64=("$_release/tantivy-$pkgver-cp311-abi3-manylinux_2_17_x86_64.manylinux2014_x86_64.whl")
source_aarch64=("$_release/tantivy-$pkgver-cp311-abi3-manylinux_2_17_aarch64.manylinux2014_aarch64.whl")
sha256sums_x86_64=('2d5d5ac2f16038b7ea4cfc10839d20dbec87b5a96076b0984b493e410c1a8415')
sha256sums_aarch64=('7e3ba1f366e05a4ebf176cd549206fa25bdac9ea722637b21fa351582b65440e')
noextract=("${source_x86_64[0]##*/}" "${source_aarch64[0]##*/}")

prepare(){
 bsdtar -xOf "$srcdir/$_wheel" "tantivy-$pkgver.dist-info/licenses/LICENSE" > "$srcdir/LICENSE"
}

package(){
 python -m installer --destdir="$pkgdir" "$srcdir/$_wheel"
 install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
