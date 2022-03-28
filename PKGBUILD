# Maintainer: lxgr <lxgr@protonmail.com>

pkgname='starport-git'
pkgver=nightly
pkgrel=1
pkgdesc="The all-in-one platform to build, launch and maintain any crypto application on a sovereign and secured blockchain"
arch=(any)
url="https://starport.com"
license=('Apache')
provides=('starport')
depends=()
makedepends=('git' 'go')
conflicts=('starport-bin')
source=("$pkgname"::'git+https://github.com/tendermint/starport')
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --tags --always | sed -r 's|release-||g;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
  make build
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm0755 -t "$pkgdir/usr/bin/" ./dist/*
}
