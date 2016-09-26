# Maintainer: Kyle Manna <kyle[at]kylemanna[dot]com>

pkgname=remote_syslog2
pkgver=0.18
pkgrel=1
pkgdesc="remote_syslog tails one or more log files and sends syslog messages to a remote central syslog server"
arch=('x86_64' 'i686')
url="https://github.com/papertrail/remote_syslog2"
license=('MIT')
makedepends=('go' 'godep')
options=('!strip' '!emptydirs')
source=("https://github.com/papertrail/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('5f80881fb5b2d0fb590fe26f5a416729c9867ed80757a5b3843eda9a8455b187')

prepare() {
  cd "$pkgname-$pkgver"

  mkdir -p Godeps/_workspace/src/github.com/papertrail
  ln -sfT ../../../../../ Godeps/_workspace/src/github.com/papertrail/remote_syslog2
}

build() {
  cd "$pkgname-$pkgver"

  #./build.sh
  #godep go build -o $BUILDPATH/remote_syslog .
  godep go build .
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm644 -t "$pkgdir/usr/share/${pkgname}" README.md LICENSE example_config.yml
  install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/$pkgname"
}

# vim:set ts=2 sw=2 et:
