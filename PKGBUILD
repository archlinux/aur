# Maintainer: thorko contact@thorko.de
pkgname=loki-bin
pkgver=
pkgrel=
pkgdesc="Loki: like Prometheus, but for logs."
arch=('x86_64')
url='https://github.com/grafana/loki'
license=('AGPL-3.0-only')
source_x86_64=("https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-${pkgver}-linux-x86_64.tar.gz")
sha256sums_x86_64=('2e22f54f74792726f1ade4311ecca8079bfd6c1f5a7d15670b7e438782ae578d')

source=(
  "elasticsearch.service"
  "sysctl.conf"
  "users.conf"
)

sha256sums=(
  'e42a11bfcacad2d600dad28f88d94553a03e598eba69c58f677a61b2e7ea4e7b'
  'b3feb1e9c7e7ce6b33cea6c727728ed700332aae942ca475c3bcc1d56b9f113c'
  'fc9683349457f56bcd044cd8e711bc8efd43d32f9547d5b21a66650c6dfbed73'
)

package() {
    mkdir -p "${pkgdir}/opt"
    cp -R "${srcdir}/elasticsearch-${pkgver}" "${pkgdir}/opt/elasticsearch"
    install -Dm0644 "elasticsearch.service" "${pkgdir}/etc/systemd/system/elasticsearch.service"
    install -Dm0644 "sysctl.conf" "${pkgdir}/usr/lib/sysctl.d/elasticsearch.conf"
    install -Dm0644 "users.conf" "${pkgdir}/usr/lib/sysusers.d/elasticsearch.conf"
}
