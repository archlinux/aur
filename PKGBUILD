# Maintainer: zotan <aur@zotan.email>

pkgname=snid
pkgver=0.4.0
pkgrel=1
pkgdesc="SNI-based Proxy Server"
arch=(i686 x86_64 arm armv6h armv7h aarch64)
url="https://github.com/AGWA/snid"
license=(MIT)
depends=(glibc)
makedepends=(go)
source=("$pkgname-$pkgver.tar.gz::https://github.com/AGWA/snid/archive/v$pkgver.tar.gz")
sha256sums=('3cfa371823e374fcb6eb9d6169ed3e163f4366df872c754fb830ef2955d0d377')

build() {
  cd "$pkgname-$pkgver"
  export GOPATH="$SRCDEST/go-modules"

  go build \
    -gcflags "all=-trimpath=${PWD}" \
    -asmflags "all=-trimpath=${PWD}" \
    -ldflags "-extldflags ${LDFLAGS}"
}

package() {
  cd "$pkgname-$pkgver"
  install -D snid ${pkgdir}/usr/bin/snid
}
