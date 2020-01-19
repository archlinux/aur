# Maintainer: Sorah Fukumori <her@sorah.jp>
pkgname=prometheus-junos-exporter
pkgver=0.9.5.6
pkgrel=2
pkgdesc="https://github.com/czerwonk/junos_exporter"
arch=('x86_64')
url="https://github.com/czerwonk/junos_exporter"
license=('MIT')
makedepends=('go-pie')
backup=('etc/prometheus-junos-exporter/config.yml'
  'etc/conf.d/prometheus-junos-exporter')
source=(
  "prometheus-junos-exporter.service"
  "config.yml"
  "confd"
  "https://github.com/czerwonk/junos_exporter/archive/${pkgver}.tar.gz"
)
sha256sums=('83c92eb98c5451c73d53cd70544e85a50d1cd4b3b07b404ccc332e4abe0886c3'
            '0cf56736f996e2b5a563b7ea3b2f0b175a7f3e9dede0152a8974d897a2ba6f79'
            '6756bc5e6f78f73accf0f323de7104c8d764fead7c97f298c3b5b3bf377cb114'
            'a3a94b5f5147e123c257c360fae537912e7e6c96943e238d25b85e3e85f17da7')
sha512sums=('648a165b5276b41d3fafd64b73ad78e995797a2a0e1cb86bc465f90e6301d2677bb06241c80a3bdb2e920e09a358f73bc3fef81de4aedaa8fc17c4394fcf2740'
            '60d8990ce6ddf47b58b9e5cbecf0438f0c7f9b583e09b2d08f3f49bd0308c69e9d29412470e168bc07989bf9cf4a10dc0606933dd225bd61fe17cfd4ccff3a05'
            '62944d88850fe278139b6a02bd084f54fe29e09191201df44446e45ce3087b0b2c002a026fcd751e8f2e2617ba297258c6cc0c6f8feb40eda9d47ab4b8d22b92'
            'bdbde2287e1c6d85e6a80c9a4f933afbef80fdebe4750618603517d6e8fec5dcd8bb41151fab2e3b419c41fa7b17a6217f4236768b6eb9ecbd37e529953827c0')


build() {
  cd "junos_exporter-$pkgver"

  go build \
      -trimpath \
      -ldflags "-extldflags $LDFLAGS" \
      -o prometheus-junos-exporter .
}

package() {
  cd "junos_exporter-$pkgver"
  install -Dm0755 prometheus-junos-exporter "${pkgdir}/usr/bin/prometheus-junos-exporter"
  install -Dm0644 "${srcdir}/prometheus-junos-exporter.service" "${pkgdir}/usr/lib/systemd/system/prometheus-junos-exporter.service"
  install -Dm0644 "${srcdir}/config.yml" "${pkgdir}/etc/prometheus-junos-exporter/config.yml"
  install -Dm0644 "${srcdir}/confd" "${pkgdir}/etc/conf.d/prometheus-junos-exporter"
}

