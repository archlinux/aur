# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=ollamaurl
pkgver=1.0.2
pkgrel=1
pkgdesc='See what ollama pull would have fetched'
arch=(x86_64)
url='https://github.com/xyproto/ollamaurl'
license=(BSD-3-Clause)
makedepends=(git go)
source=("git+$url#tag=v$pkgver")
b2sums=('dc03405c1e40b0bc026d4162935baad8e8e20fea4009283f896e1ec95ac60ba622b035ca270d5c5236af6c7291b9f8bf93329517062890cb4bc7154f9a1f1bf2')

build() {
  cd $pkgname
  go build -mod=readonly -v -trimpath -buildmode=pie -ldflags="-s -w -extldflags '$LDFLAGS'"
}

package() {
  install -Dm755 -t "$pkgdir/usr/bin" $pkgname/$pkgname
  install -Dm755 -t "$pkgdir/usr/share/licenses/$pkgname" $pkgname/LICENSE
}
