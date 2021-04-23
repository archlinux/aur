# Maintainer: Andrey Novikov <envek@envek.name>

pkgname=lefthook
pkgdesc="git hooks manager"
pkgver=0.7.3
pkgrel=1
arch=('i686' 'x86_64')
url="https://github.com/evilmartians/lefthook"
license=('MIT')
makedepends=('go' 'rsync')
source=("https://github.com/evilmartians/lefthook/archive/v${pkgver}.tar.gz")
sha256sums=('643bb3d2a1b67d865285a9cadcad11f2588ba284570ab9924c8e3d2e902301ca')

build() {
  cd "$pkgname-$pkgver"
  go build \
    -gcflags "all=-trimpath=${PWD}" \
    -asmflags "all=-trimpath=${PWD}" \
    -ldflags "-extldflags ${LDFLAGS}" \
    .
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
}