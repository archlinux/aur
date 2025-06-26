# Maintainer: Daniel Hufschläger <daniel at hufschlaeger dot net>
#
pkgname=tasky-git
pkgver=1.0.0
pkgrel=1
pkgdesc='A sleek, powerful CLI task management tool'
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64' 'riscv64')
license=('GPL-3.0-or-later')
url='https://github.com/shahriaarrr/Tasky'
depends=('go')
makedepends=(
  'git'
)
options=(!lto)
source=("${pkgname}::git+${url}.git")
md5sums=('SKIP')
provides=("${pkgname}")
conflicts=("${pkgname}")

build() {
  export GOPATH="$srcdir"/gopath
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_ENABLED=1

  cd "$srcdir/$pkgname"
  go build -trimpath -mod=readonly -modcacherw -ldflags "-s -w" ./cli/tasky 
}

package() {
  install -dm755 "${pkgdir}/usr/bin"
  cp -r "${srcdir}/${pkgname}"/tasky "${pkgdir}/usr/bin/" 
}
