# Maintainer: Igor Kulkov <xp.jfk9w@gmail.com>

pkgname=prometheus-consul-exporter-bin
_pkgname=prometheus-consul-exporter
pkgver=0.13.0
pkgrel=1

pkgdesc='Export Consul service health to Prometheus (binary)'
url='https://github.com/prometheus/consul_exporter'
arch=('x86_64' 'aarch64' 'armv7h')
license=('Apache-2.0')

depends=('glibc')
provides=("${_pkgname}")
backup=("etc/conf.d/${_pkgname}")
source=("${_pkgname}.conf"
        "${_pkgname}.service"
        "${_pkgname}.sysusers"
        "${_pkgname}.tmpfiles")
source_x86_64=("https://github.com/prometheus/consul_exporter/releases/download/v${pkgver}/consul_exporter-${pkgver}.linux-amd64.tar.gz")
source_aarch64=("https://github.com/prometheus/consul_exporter/releases/download/v${pkgver}/consul_exporter-${pkgver}.linux-arm64.tar.gz")
source_armv7h=("https://github.com/prometheus/consul_exporter/releases/download/v${pkgver}/consul_exporter-${pkgver}.linux-armv7.tar.gz")

package() {
    case "${CARCH}" in
        x86_64)
            _arch='amd64'
            ;;
        aarch64)
            _arch='arm64'
            ;;
        armv7h)
            _arch='armv7'
            ;;
    esac

    install -Dm755 "${srcdir}/consul_exporter-${pkgver}.linux-${_arch}/consul_exporter" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm640 "${srcdir}/${_pkgname}.conf" "${pkgdir}/etc/conf.d/${_pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
    install -Dm644 "${srcdir}/${_pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${_pkgname}.conf"
    install -Dm644 "${srcdir}/${_pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${_pkgname}.conf"
}

sha256sums=('03c24e891533da287ba2485a7843dab118a08efb3fbdc410810ca0dbbcded51e'
            '369b8017a9fbd4d771a696b281618c100daae4989e3ccf5f6bf567224e537871'
            'c57357fe54341d2ce2dbbdc3f7e3d68b96afcee7c9bb9a110a4b42c72035673e'
            'f24782c0458fb70b2e39ac788c691429b23cd9be89770ac17be3f0c8a572303b')
sha256sums_x86_64=('2a8da4147330c6e19c9665deca1c419d507e100de6c8b7c58c0715ff25453773')
sha256sums_aarch64=('a5ecc969647cc67f171eff13468e25fe713f95a8af4135e1c0cf716a64c5474f')
sha256sums_armv7h=('37178397d778c88f4d7f5701bfac5cd943284fa5966eb97c380b3f2108c68ec3')
