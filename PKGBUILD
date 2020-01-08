# Maintainer: Nils Czernia <nils [at] czserver.de>

pkgname=loki-bin
_pkgname=loki
pkgver=1.2.0
pkgrel=1
pkgdesc="Loki is a horizontally-scalable, highly-available, multi-tenant log aggregation system inspired by Prometheus"
url="https://grafana.com/oss/loki/"
license=("Apache")
arch=("x86_64" "armv7h" "aarch64")
backup=("etc/loki/loki.yml")
source=("loki.service"
        "loki.sysusers"
        "https://raw.githubusercontent.com/grafana/loki/v${pkgver}/cmd/loki/loki-local-config.yaml")

source_x86_64=("https://github.com/grafana/loki/releases/download/v${pkgver}/${_pkgname}-linux-amd64.zip")
source_armv7h=("https://github.com/grafana/loki/releases/download/v${pkgver}/${_pkgname}-linux-arm.zip")
source_aarch64=("https://github.com/grafana/loki/releases/download/v${pkgver}/${_pkgname}-linux-arm64.zip")
sha256sums=('d83da3cb1a974d0feced4afebbb8f09a6518a7cab5e42b0d30948d328dac2d85'
            '1c0eee36cb10f4283913c300986a85d9170282dd0223207ed032cc298e9cb491'
            '1dbfb2831466979093653ed08237be247cd0fb7a36da6316e5c7bcb3c192aba1')
sha256sums_x86_64=('f78d432034737e5fde993e5ae6a6e6592e5ced4d2c6d2220f30cbfdea8cfd446')
sha256sums_armv7h=('f0d01a624ca1f92e928ce43823fb37d0b51305c2da964d17feec0bef704a1e95')
sha256sums_aarch64=('5dba7fd149142750c1b333a86029b70b150c05b92d51938b1f81ce8557cff981')


package() {
	case "$CARCH" in
		"x86_64") ARCH="amd64";;
		"armv7h") ARCH="arm";;
		"aarch64") ARCH="arm64";;
	esac

	cd "${srcdir}"
	install -D -m0644 "loki.service" "${pkgdir}/usr/lib/systemd/system/loki.service"
	install -D -m0644 "loki.sysusers" "${pkgdir}/usr/lib/sysusers.d/loki.conf"
	install -D -m0644 "loki-local-config.yaml" "${pkgdir}/etc/loki/loki.yml"
	
	install -D -m0755 "${_pkgname}-linux-$ARCH" "${pkgdir}/usr/bin/loki"
}
