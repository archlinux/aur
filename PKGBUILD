# Maintainer: Kevin Gravier
pkgname=ty3status-git
pkgver=0.5.1.r2.g0d610c8
pkgrel=1
pkgdesc="ty3status is an i3status replacement written in typescript with first classes support for javascript blocks."
arch=(any)
url="https://github.com/mrkmg/ty3status"
license=('MIT')
groups=()
depends=('nodejs')
makedepends=('git' 'nodejs' 'npm')
provides=(ty3status)

source=(ty3status::git+https://github.com/mrkmg/ty3status.git)
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd ty3status
  yarn || npm install
  npm run build
}

package() {
  cd ty3status
  mkdir -p "$pkgdir/usr/bin/"
  mkdir -p "$pkgdir/etc"
  cp "ty3status" "$pkgdir/usr/bin/ty3status"
  cp "ty3status.yaml" "$pkgdir/etc/ty3status.yaml"
}

pkgver() {
    cd ty3status
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
