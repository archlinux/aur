# Maintainer:  mrxx <mrxx at cyberhome dot at>

pkgname=nat-tcp-test-git
_pkgname=NAT-TCP-test
pkgver=r25.cbb1eb5
pkgrel=1
pkgdesc="TCP established connection idle-timeout tests for NAT implementations"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/AndersTrier/$_pkgname"
license=('unknown')
makedepends=('git')
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"
  make
}

package() {
  install -d "$pkgdir"/usr/bin
  for file in tcp-send-test tcp-recv-test tcp-keepalive-test; do
    install -Dm755 "$srcdir/$_pkgname/$file" "$pkgdir/usr/bin/$file"
  done
}

