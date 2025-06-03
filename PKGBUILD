# Maintainer: Fabien LEFEBVRE <contact@d1ceward.com>

pkgname=lucky-git
pkgver=r735.ccaa571
pkgrel=1
pkgdesc='A Crystal command-line tool for generating new Lucky Web Applications'
arch=('x86_64')
url='https://github.com/luckyframework/lucky_cli'
license=('MIT')
depends=('crystal'
         'shards')
makedepends=('git')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')
provides=('lucky')
conflicts=('lucky')

pkgver() {
  cd ${pkgname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${pkgname}

  # Install dependencies
  PATH="/usr/bin" shards install

  # Build lucky cli
  PATH="/usr/bin" shards build --progress --release --no-debug
}

package() {
  cd ${pkgname}

  install -Dm755 "bin/lucky" "${pkgdir}/usr/bin/lucky"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
