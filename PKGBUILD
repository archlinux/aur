# Maintainer: Nils Czernia <nils [at] czserver.de>

pkgname=loki-bin
_pkgname=loki
pkgver=1.0.0
pkgrel=1
pkgdesc="Loki is a horizontally-scalable, highly-available, multi-tenant log aggregation system inspired by Prometheus"
url="https://grafana.com/oss/loki/"
license=("Apache")
arch=("x86_64" "armv7h" "aarch64")
backup=("etc/loki/loki.yml")
source=("loki.service"
        "loki.sysusers"
        "https://raw.githubusercontent.com/grafana/loki/v${pkgver}/cmd/loki/loki-local-config.yaml")

source_x86_64=("https://github.com/grafana/loki/releases/download/v${pkgver}/${_pkgname}-linux-amd64.gz")
source_armv7h=("https://github.com/grafana/loki/releases/download/v${pkgver}/${_pkgname}-linux-arm.gz")
source_aarch64=("https://github.com/grafana/loki/releases/download/v${pkgver}/${_pkgname}-linux-arm64.gz")

sha256sums=('d83da3cb1a974d0feced4afebbb8f09a6518a7cab5e42b0d30948d328dac2d85'
            '1c0eee36cb10f4283913c300986a85d9170282dd0223207ed032cc298e9cb491'
            '1dbfb2831466979093653ed08237be247cd0fb7a36da6316e5c7bcb3c192aba1')
sha256sums_x86_64=('ada29e4dbab6dc901c74ec50a266ef34a45b15a5a888300377d12c4ea93a8b50')
sha256sums_armv7h=('332cf7889ddeb390ffa36231bd19e5cc44bacabeb31909f2345085ebe03dc47f')
sha256sums_aarch64=('e30361f12ed190ef9e927bdc8f1f7d8ddca7773b4f15c43e8886abefa9539bec')


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
