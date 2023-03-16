# Maintainer: iflygo <iflygo@outlook.com>

_pkgname='seam'
pkgname="${_pkgname}-git"
pkgver=0.1.23.r20.g154a79e
pkgrel=1
pkgdesc="Get real url, support douyu, huyu, bilibili etc"
arch=('any')
url="https://github.com/Borber/seam"
license=('')
depends=('openssl-1.1' 'zlib')
makedepends=(
  'git'
  'cargo'
  'rust'
)
provides=(
  "${_pkgname}"
  )
conflicts=(
  "${_pkgname}"
  )
source=(
  "${_pkgname}::git+https://github.com/Borber/seam.git"
  )
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g;s/^v//'
}

build() {
  cd "$srcdir/$_pkgname"
  cargo build --release
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm755 "target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
