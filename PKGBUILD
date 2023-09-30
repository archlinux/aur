# Maintainer: Jason Nader <jason.nader@protonmail.com>

pkgname=grafana-apprise-adapter-git
pkgver=0.1.0.r32.g520f47f
pkgrel=1
pkgdesc='Send grafana alerts to apprise for notifications'
arch=('any')
url='https://github.com/ammgws/grafana-apprise-adapter'
license=('custom:BSD-3-Clause')
makedepends=('git' 'rust')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("${pkgname%-*}::git+$url")
sha1sums=('SKIP')

pkgver() {
  cd "${pkgname%-*}"
  echo $(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2).r$(git rev-list --count HEAD).g$(git describe --always)
}

build() {
  cd "${pkgname%-*}"
  cargo build --release
}

package() {
  cd "${pkgname%-*}"
  install -Dm755 target/release/${pkgname%-*} "$pkgdir/usr/bin/${pkgname%-*}"
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/"${pkgname%-*}"
}
