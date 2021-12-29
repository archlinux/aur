#!/bin/sh

# Maintainer: Zhuo FENG <fenprace.i@gmail.com>

pkgname=mosdns-cn
pkgver=1.1.5
pkgrel=1
pkgdesc="A DNS forwarder"
license=("GPL3")
arch=("any")
url="https://github.com/IrineSistiana/mosdns-cn"
makedepends=("go")
optdepends=('v2ray-domain-list-community: geosite.dat'
            'v2ray-geoip: geoip.dat'
            'v2ray-rules-dat-git: geosite.dat & geoip.dat')
provides=("mosdns-cn")
conflicts=("mosdns-cn")
source=("$pkgname-$pkgver.tar.gz::https://github.com/IrineSistiana/mosdns-cn/archive/refs/tags/v$pkgver.tar.gz")

build() {
  cd "$pkgname-$pkgver"
  GOPATH="$srcdir/gopath" go build -trimpath -ldflags "-s -w -X main.version=$pkgver" .
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}

sha256sums=('2da016e063512ae4e2dfb05671c8f791a41de408fa6236a3c401cab9b2041ecb')
