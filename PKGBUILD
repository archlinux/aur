# Maintainer: Jordan Knott <jordan at jordanthedev dot com>
# Contributor: Jordan Knott <jordan at jordanthedev dot com>
pkgname=chrono
pkgver=1.0.0_beta
pkgrel=1
pkgdesc='A time tracking tool made with love'
arch=('x86_64')
url="https://github.com/gochrono/${pkgname}"
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
conflicts=("chrono-git")
source=("${pkgname}::git+${url}.git#tag=v${pkgver//_/-}")
md5sums=('SKIP')

build() {
  cd $pkgname
  go build \
    -gcflags "all=-trimpath=$PWD" \
    -asmflags "all=-trimpath=$PWD" \
    -ldflags "-extldflags $LDFLAGS" \
    -o $pkgname .
}

package() {
  cd $pkgname
  install -Dm755 $pkgname -t "$pkgdir"/usr/bin/
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
