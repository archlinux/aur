# Maintainer: David Birks <david@tellus.space>

pkgname=sanic
pkgdesc='An all-in-one tool to develop, build, and deploy your Docker/Kubernetes projects'
pkgver=1.2.13
pkgrel=1
arch=('x86_64')
license=('Apache')
url='https://github.com/distributed-containers-inc/sanic'
depends=('kubectl' 'docker')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/distributed-containers-inc/sanic/archive/v$pkgver.tar.gz")
sha256sums=('ffb3eb245351239ecc1b4b13e208d35244540cfbcdf6735cbf86059ab9b1526b')

build() {
  # Trim PWD from binary
  export GOFLAGS="-gcflags=all=-trimpath=${PWD} -asmflags=all=-trimpath=${PWD} -ldflags=-extldflags=-zrelro -ldflags=-extldflags=-znow"

  cd $pkgname-$pkgver
  go build --ldflags "-X main.version=$pkgver" .
}

package() {
  install -Dm 755 "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
