# Maintainer: Jens L. Nedregård <jensl@nedregard.no>
pkgname=sentry-watcher
pkgver=0.3.1
pkgrel=1
pkgdesc="Build/Runs your crystal application, watches files, and rebuilds on file changes"
arch=('x86_64')
url="https://github.com/samueleaton/sentry"
license=('MIT')
depends=('gc' 'libevent' 'pcre')
makedepends=('crystal')
source=("https://github.com/samueleaton/${pkgname%-watcher}/archive/v$pkgver.tar.gz")
md5sums=('bfdd1af0d4631a4819c74edb817f74b8')

build() {
  cd "${pkgname%-watcher}-$pkgver"
  crystal build --release src/sentry_cli.cr -o ./sentry
}

package() {
  cd "${pkgname%-watcher}-$pkgver"
  install -D -m 644 LICENSE "$pkgdir/usr/share/licenses/${pkgname%-watcher}/LICENSE"
  install -D -m 755 ./sentry "$pkgdir/usr/bin/sentry"
}
