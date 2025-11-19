# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=protoc-gen-js
pkgver=4.0.1
pkgrel=1
pkgdesc="Protocol Buffers for JavaScript"
arch=('x86_64' 'aarch64')
url="https://github.com/protocolbuffers/protobuf-javascript"
license=('Apache-2.0 AND BSD-3-Clause')
depends=('protobuf')
makedepends=(
  'bazel'
  'npm'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('123fac2e86109b24e80ccd356aa914e268bf5863ad1354d224d6ceaed6f5c45b')

build() {
  cd "protobuf-javascript-$pkgver"
  export npm_config_cache="$srcdir/npm_cache"
  npm ci
  npm run build
  bazel build plugin_files
}

package() {
  cd "protobuf-javascript-$pkgver"
  install -Dm755 "bazel-bin/generator/$pkgname" -t "${pkgdir}/usr/bin/"
  install -Dm644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
