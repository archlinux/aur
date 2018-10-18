# Maintainer: Jonne Haß <me@jhass.eu>
pkgname=camo.cr-git
pkgver=r41.0778b3e
pkgrel=1
pkgdesc="A crystal version of atmos/camo, faster and with better request lifecycle tracing"
arch=('i686' 'x86_64')
url="https://github.com/RX14/camo.cr"
license=('MIT')
depends=('gc'  'libatomic_ops'  'pcre' 'libevent')
makedepends=('crystal' 'shards')
checkdepends=('ruby' 'ruby-rake' 'ruby-bundler')
backup=()
source=("git+https://github.com/RX14/camo.cr.git" "camocr.service")

pkgver() {
  cd "${pkgname/-git/}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${pkgname/-git/}"
  shards install
}

build() {
  cd "${pkgname/-git/}"
  shards build --release
}

check() {
  cd "${pkgname/-git/}"
  crystal spec
}

package() {
  cd "${pkgname/-git/}"
  install -Dm755 bin/camo "$pkgdir/usr/bin/camo"
  install -Dm644 ../camocr.service "$pkgdir/usr/lib/systemd/system/camocr.service"
}
sha256sums=('SKIP'
            '61fdc0812e66e5a479fa486fbb75444d3a31ab684bc1372681f798c524fa0153')
