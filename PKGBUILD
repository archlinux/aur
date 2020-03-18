# Maintainer: aksr <aksr at t-com dot me>
pkgname=vtt2srt-git
pkgver=r12.e0c6a9c
pkgrel=3
epoch=
pkgdesc="Lightweight WebVTT (VTT) to SubRip Text (SRT) subtitle converter."
arch=('i686' 'x86_64')
url="https://github.com/rzumer/VTT2SRT"
license=('MIT')
categories=()
makedepends=('git' 'go')
_gourl=github.com/rzumer/VTT2SRT

pkgver() {
  GOPATH="$srcdir" go get -d ${_gourl}
  cd "$srcdir/src/${_gourl}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  GOPATH="$srcdir" go get -fix -v ${_gourl}
}

package() {
  cd "$srcdir"
  install -Dm755 bin/VTT2SRT "$pkgdir/usr/bin/vtt2srt"
  install -Dm644 src/${_gourl}/README.md $pkgdir/usr/share/doc/${pkgname%-*}/README.md
  install -Dm644 src/${_gourl}/LICENSE.md $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
}

