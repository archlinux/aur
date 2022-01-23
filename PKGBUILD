# Maintainer: Jigsaw <j1g5aw@foxmail.com>

pkgname=go-cqhttp-dev-git
pkgver=1.0.0.beta8.fix2.r51.g6916fb7
pkgrel=1
pkgdesc="Lightweight, native cross-platform implementation of cqhttp in Golang (Development Release)."
arch=("i686" "x86_64" "armv7h" "aarch64")
url="https://github.com/Mrs4s/go-cqhttp/tree/dev"
license=("AGPL3")
optdepends=("ffmpeg: support voice sending in any format")
makedepends=("git" "go")
provides=("go-cqhttp")

source=("$pkgname::git+https://github.com/Mrs4s/go-cqhttp#branch=dev")

sha512sums=("SKIP")

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed "s/^v//;s/\([^-]*.g\)/r\1/;s/-/./g"
}

build(){
    cd "$pkgname"
    go build -trimpath -ldflags "-s -w -X github.com/Mrs4s/go-cqhttp/internal/base.Version=$pkgver"
}

package() {
    cd "$pkgname"
    install -Dm755 "go-cqhttp" "${pkgdir}/usr/bin/go-cqhttp"
}
