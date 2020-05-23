# Maintainer: Sorah Fukumori <her@sorah.jp>
pkgname=prometheus-remo-e-exporter
pkgver=0.0.2
pkgrel=1
pkgdesc="Prometheus exporter for Nature Remo E series"
arch=('x86_64' 'aarch64')
url="https://github.com/sorah/remo-e-exporter"
license=('MIT')
makedepends=('cargo')
backup=('etc/conf.d/prometheus-remo-e-exporter')
source=(
  "prometheus-remo-e-exporter.service"
  "prometheus-remo-e-exporter.conf.d"
  "https://github.com/sorah/remo-e-exporter/archive/v${pkgver}.tar.gz"
)

build() {
  cd "remo-e-exporter-$pkgver"
  cargo build --release --locked --all-features
}

package() {
  cd "remo-e-exporter-$pkgver"
  install -Dm0755 target/release/remo_e_exporter "${pkgdir}/usr/bin/prometheus-remo-e-exporter"
  install -Dm0644 "${srcdir}/prometheus-remo-e-exporter.service" "${pkgdir}/usr/lib/systemd/system/prometheus-remo-e-exporter.service"
  install -Dm0640 "${srcdir}/prometheus-remo-e-exporter.conf.d" "${pkgdir}/etc/conf.d/prometheus-remo-e-exporter"
}
sha512sums=('6b5bec9b6367582a8e04b8479d3e11e96f2eaa7bdae6b1d4962e6517f3018c21d6fd65b83b620521fbc9b51e539d27991ea1b9ab3f372d383f4525ab9c085f82'
            '2f8306e46e1a7c16817ff696e6d3e9f46dfcd8ba6f474bd0937daf0c26f3b30353c1c299b48216380080f31e4a6b6915928b9cbf4b44090eac3454ba554ba821'
            '90eaabbcb166225c232f150e16030add5ae553bceae72b30456dd6e9494041e087e6de18bb93128c37c9f2232d9bc49522e219e1050688b5b05691ad7d14ff93')
