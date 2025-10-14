# Maintainer: Ben Leynen <leynenben@gmail.com>
# Contributor: Vianney Bouchaud <aur dot vianney at bouchaud dot org>

pkgname=grafana-alloy-bin
_pkgname=grafana-alloy
_binaryname=alloy
pkgdesc="OpenTelemetry Collector distribution with programmable pipelines."
pkgver=1.11.2
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

sha256sums_x86_64=('75c8cf27778d992a9e90075924b53fc601d0c744c6d698da61ac04282afe8381'
                   'bd1b372bd6ef5f362858a3b6f193f697b85f5da05c46802166d1bb888a54e426'
                   '2da847dc592dabb19b3f77f3bf714348327667090040a741244cab1f6e08306c')
sha256sums_aarch64=('706033080041272b19159008375c2f924620308acaac4557ff8d170d3264b3bf'
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
