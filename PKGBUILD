pkgname=btc-cirrus-reporter
pkgver=db2b312
pkgrel=2
pkgdesc='bitcoin core cirrus reporter'
arch=('any')
url="https://github.com/pro-bitcoin/cirrus-ci-reporter"
license=('MIT')
makedepends=('go' 'make')
source=("${pkgname}::git+https://github.com/pro-bitcoin/cirrus-ci-reporter.git" "btc-cirrus-reporter.service" "btc-cirrus-reporter.env" "btc-cirrus-reporter.timer")
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')
backup=('etc/default/btc-cirrus-reporter')

pkgver() {
  cd "$srcdir/${pkgname}"
  git describe --long --tags --always | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$pkgname"
  make build
}

package() {
  cd "$pkgname"
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm600 "$srcdir/btc-cirrus-reporter.env"  "$pkgdir/etc/default/btc-cirrus-reporter"
  install -Dm644 "$srcdir/btc-cirrus-reporter.service" -t "$pkgdir/usr/lib/systemd/system"
  install -Dm644 "$srcdir/btc-cirrus-reporter.timer" -t "$pkgdir/usr/lib/systemd/system"
}
