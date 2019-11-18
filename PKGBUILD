# Maintainer: Nils Czernia <nils [at] czserver.de>

pkgname=loki-bin
_pkgname=loki
pkgver=0.4.0
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

sha256sums=("d83da3cb1a974d0feced4afebbb8f09a6518a7cab5e42b0d30948d328dac2d85"
            "1c0eee36cb10f4283913c300986a85d9170282dd0223207ed032cc298e9cb491"
            "1dbfb2831466979093653ed08237be247cd0fb7a36da6316e5c7bcb3c192aba1")
sha256sums_x86_64=("f99f364b44e8d93d3b8b398cf00438c3081f3633e711ac34cc9f369fd5c2eff5")
sha256sums_armv7h=("853d7eae9841aba5802c447e15ec96fc27a4e01cb2782a50bfb07e2198859f66")
sha256sums_aarch64=("c4d91d5bef69756f76912d037ac97d358f39cc10fc02ee782024fdda67dc4690")


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
