pkgname=saberlight
pkgdesc='Collection of tools to control some "smart" BLE bulbs.'
author=madhead
repo=github.com
pkgver=r31.71fc2f8
pkgrel=1
url="https://github.com/${author}/${pkgname}"
license=('APACHE')
arch=('x86_64')
makedepends=('git' 'go')
provides=(${pkgname})
source=("${pkgname}::git://${repo}/${author}/${pkgname}")
md5sums=('SKIP')
install=$pkgname.install

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  export GOPATH="${srcdir}"
  export GO15VENDOREXPERIMENT="1"
  mkdir -p ${srcdir}/src/${repo}/${author}
  ln -s ${srcdir}/${pkgname} ${srcdir}/src/${repo}/${author}
  cd $srcdir/src/${repo}/${author}/${pkgname}
  make build VERSION=${pkgver}
}

package() {
  install -Dm755 "${srcdir}/${pkgname}/app/${pkgname}" "$pkgdir/usr/bin/$pkgname"
}
