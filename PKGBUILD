# Maintainer: Jan Hensel <ja_he@uni-bremen.de>
pkgname=dayplan
pkgver=0.7.2
pkgrel=1
arch=('x86_64')
pkgdesc="Utility to plan your day and track your time"
license=('MIT')
url="https://github.com/ja-he/dayplan"
depends=('glibc')
makedepends=('go')
optdepends=()
backup=()
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('0b4179d8a6028a24954d30b471217af5d12da0ecd385304db52191f04d3bbfc9')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  project_base="github.com/ja-he/dayplan"
  source_root="${project_base}/src"
  go build -v \
    -gcflags "all=-trimpath=${PWD}" \
    -asmflags "all=-trimpath=${PWD}" \
    -ldflags="-X '${source_root}/control/cli.version=v${pkgver}' -X '${source_root}/control/cli.hash=aur build from v${pkgver}'" \
    -buildmode=pie
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 "./dayplan" "$pkgdir/usr/bin/dayplan"
  install -Dm644 "./LICENSE" "${pkgdir}/usr/share/licenses/dayplan/LICENSE"
}
