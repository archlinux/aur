# Maintainer: Jordan Knott <jordan at jordanthedev dot com>
# Contributor: Jordan Knott <jordan at jordanthedev dot com>
_pkgname=chrono
pkgname="${_pkgname}-git"
pkgver=v1.0.0.beta.r25.gb2a464e
pkgrel=1
pkgdesc='A time tracking tool made with love'
arch=('x86_64')
url="https://github.com/gochrono/${_pkgname}"
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
provides=("chrono")
conflicts=("chrono")
source=("${_pkgname}::git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $_pkgname
  go build \
    -gcflags "all=-trimpath=$PWD" \
    -asmflags "all=-trimpath=$PWD" \
    -ldflags "-extldflags $LDFLAGS" \
    -o $_pkgname .
}

package() {
  cd $_pkgname
  install -Dm755 $_pkgname -t "$pkgdir"/usr/bin/
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
