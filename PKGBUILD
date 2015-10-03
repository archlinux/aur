# Maintainer: Dennis Fink <metalgamer@c3l.lu>
# Contributor: Rémi Audebert <rflah0@gmail.com>

_pkgname=node_exporter
pkgname=prometheus-node-exporter-git
pkgver=r266.ee6b8e7
pkgrel=1
pkgdesc="Prometheus exporter for machine metrics "
arch=('x86_64' 'i686')
url="https://github.com/prometheus/node_exporter"
conflicts=(prometheus-node-exporter)
provides=(prometheus-node-exporter)
license=('Apache')
makedepends=('go' 'git' 'mercurial')
options=('!strip' '!emptydirs')
source=("node_exporter::git+http://github.com/prometheus/node_exporter"
  "prometheus-node-exporter.service")
sha256sums=('SKIP'
  '360d44488e2c0617e8436e2420e9e1a1e657055b1bb41e1e121524f7dc99ed57')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_pkgname"

  make
}

package() {
  install -Dm644 prometheus-node-exporter.service "$pkgdir/usr/lib/systemd/system/prometheus-node-exporter.service"

  cd "$_pkgname"

  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/prometheus_$_pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
