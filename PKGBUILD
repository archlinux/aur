# Maintainer: Ben Leynen <leynenben@gmail.com>
# Contributor: Vianney Bouchaud <aur dot vianney at bouchaud dot org>

pkgname=grafana-alloy-bin
_pkgname=grafana-alloy
_binaryname=alloy
pkgdesc="OpenTelemetry Collector distribution with programmable pipelines."
pkgver=1.10.0
pkgrel=1
arch=('x86_64' 'aarch64')
url="https://github.com/grafana/alloy"
license=('apache')
conflicts=("${_pkgname}")
provides=("${_pkgname}")

backup=(
    "etc/alloy/config.alloy"
    "etc/default/alloy"
)

source_x86_64=(
    "$pkgname-$pkgver.amd64.deb::${url}/releases/download/v${pkgver}/alloy-${pkgver}-1.amd64.deb"
    'alloy-sysusers.conf'
    'alloy-tmpfiles.conf'
)

source_aarch64=(
    "$pkgname-$pkgver.arm64.deb::${url}/releases/download/v${pkgver}/alloy-${pkgver}-1.arm64.deb"
    'alloy-sysusers.conf'
    'alloy-tmpfiles.conf'
)

sha256sums_x86_64=('24b66151488d6ff2c804c29a4b74fa05477c9b50770802b8a5efde72aca36d5f'
                   'bd1b372bd6ef5f362858a3b6f193f697b85f5da05c46802166d1bb888a54e426'
                   '2da847dc592dabb19b3f77f3bf714348327667090040a741244cab1f6e08306c')
sha256sums_aarch64=('ea3c591befca82db7da38a72bec40256aca4b273a33342e5c5e37c866e596720'
                    'bd1b372bd6ef5f362858a3b6f193f697b85f5da05c46802166d1bb888a54e426'
                    '2da847dc592dabb19b3f77f3bf714348327667090040a741244cab1f6e08306c')


package() {
     tar -vxf data.tar.gz

     install -D -m0755 "${srcdir}/usr/bin/alloy" "${pkgdir}/usr/bin/alloy"
     install -D -m0644 "${srcdir}/usr/share/doc/alloy/changelog.gz" "${pkgdir}/usr/share/doc/alloy/changelog.gz"
     
     # config file
     install -D -m0644 "${srcdir}/etc/alloy/config.alloy" "${pkgdir}/etc/alloy/config.alloy"
     install -D -m0644 "${srcdir}/etc/default/alloy" "${pkgdir}/etc/default/alloy"
     
     # user and files to create, ownership and permission to set
     install -D -m0644 "${srcdir}/alloy-sysusers.conf" "${pkgdir}/usr/lib/sysusers.d/alloy.conf"
     install -D -m0644 "${srcdir}/alloy-tmpfiles.conf" "${pkgdir}/usr/lib/tmpfiles.d/alloy.conf"

      # service files
     install -D -m0644 "${srcdir}/usr/lib/systemd/system/alloy.service" "${pkgdir}/usr/lib/systemd/system/alloy.service"
}
