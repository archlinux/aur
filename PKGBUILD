# Maintainer: fuero <fuerob@gmail.com>
pkgname=timewarrior-jirapush
pkgver=0.3.0
pkgrel=1
pkgdesc="TimeWarrior Extension that uploads timewarrior intervals to Jira as work logs"
arch=('x86_64')
url="https://github.com/FoxAmes/timewarrior-jirapush"
license=('MIT')
depends=('timew')
makedepends=('cargo' 'asciidoctor' 'jq')
optdepends=(
  'bugwarrior: Pull synchronisation of JIRA issues into taskwarrior'
)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/v$pkgver.tar.gz")
sha512sums=('802053b1aed638a70faad790fad719159e64cc7056597a51870126b082fa54dd7fdb3bead0190ec698db6ee342dae7a06f6779b0b589c18a252d40965711676f')

build() {
  cd "$pkgname-$pkgver"

  cargo build --release --locked
}

check() {
  cd "$pkgname-$pkgver"

  cargo test --release --locked
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "target/release/jirapush" "$pkgdir/usr/bin/jirapush"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}

