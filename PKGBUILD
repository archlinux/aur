# Maintainer: lxgr <lxgr@protonmail.com>

pkgbase='starport-git'
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
source=("$pkgbase"::'git+https://github.com/tendermint/starport')
md5sums=('SKIP')

pkgver() {
  cd "$pkgbase"
  git describe --tags --always | sed -r 's|release-||g;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgbase"
  make build
}

package() {
  cd "$srcdir/$pkgbase"
  install -Dm0755 -t "$pkgdir/usr/bin/" ./dist/*
}
