# Maintainer: Jan Hensel <ja_he@uni-bremen.de>
pkgname=dayplan
pkgver=0.5.1
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
sha256sums=('9b4e087e396b2f3bade94ceee5e82f863161e9ea6f501d958463cfb622c55024')

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
