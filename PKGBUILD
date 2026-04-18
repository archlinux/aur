# Maintainer: thorko contact@thorko.de
pkgname=promtail-git
pkgver=3.7.1
pkgrel=1
pkgdesc="Promtail - Logshipper for Loki"
arch=('x86_64')
url='https://github.com/grafana/loki'
license=('AGPL-3.0-only')
makedepends=('git' 'go' 'make')
source=("${pkgname}::git+https://github.com/grafana/loki.git")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  git fetch
  git checkout v${pkgver}
  sed -i "s/\(go build \$(PROMTAIL_GO_FLAGS)\)/\1 --tags=promtail_journal_enabled/g" Makefile
  make promtail
}

package() {
    install -Dm0755 "$srcdir/$pkgname/clients/cmd/promtail/promtail" "${pkgdir}/usr/bin/promtail"
}
