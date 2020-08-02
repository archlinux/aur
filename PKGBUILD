# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>
# Contributor: Bambang Catur Pamungkas <bambangcaturz@gmail.com>

pkgname=sentry-cli
pkgver=1.55.1
pkgrel=1
pkgdesc="A command line utility to work with Sentry"
arch=('x86_64')
url="https://docs.sentry.io/cli/"
license=('BSD')
depends=('gcc-libs' 'zlib')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz"::https://github.com/getsentry/sentry-cli/archive/${pkgver}.tar.gz)
sha256sums=('c439c0f1acad324685b537b39f76152b4463f6cf15ec63ddfe4c4ce3a56b66c2')

build() {
  cd $pkgname-$pkgver
  cargo build --release --locked
}

check() {
  cd $pkgname-$pkgver
  cargo test --release --locked -- --skip vcs
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 target/release/sentry-cli "$pkgdir"/usr/bin/sentry-cli
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
