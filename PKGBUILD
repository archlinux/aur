# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=waypoint
pkgver=0.4.0
pkgrel=1
pkgdesc="A tool to build, deploy, and release any application on any platform"
arch=('x86_64')
url="https://www.waypointproject.io/"
license=('MPL2')
makedepends=('go' 'go-bindata')
source=("$pkgname-$pkgver.tar.gz::https://github.com/hashicorp/waypoint/archive/v$pkgver.tar.gz")
b2sums=('c17499223e5f8ed4bb7407d33ff8c798cb50a8a5db00730faa3cb4256953b2e6f128c69f5aae005dc49ec33e8d52895b3b9941c41ca26721a5745bb1f1e451a5')

prepare() {
  cd "$pkgname-$pkgver"
  sed -e "s/^GIT_COMMIT.*/GIT_COMMIT = ${pkgver}/" \
    -e "s/^GIT_DESCRIBE.*/GIT_DESCRIBE = tarball/" \
    -e "s/\$\(GIT_IMPORT\)//" \
    -e "/^GIT_DIRTY.*/d" \
    -e "s/\$(GIT_DIRTY)//" \
    -e "/^LAST_RELEASE.*/d" \
    -e "/^THIS_RELEASE.*/d" \
    -i Makefile
}

build() {
  cd "$pkgname-$pkgver"
  make bin
}

package() {
  cd "$pkgname-$pkgver"
  install -vDm755 "$pkgname" -t "$pkgdir/usr/bin"
}
