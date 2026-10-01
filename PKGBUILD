# Maintainer: Pauls Nartišs <paulsnar@paulsnar.lv>
pkgname=victorialogs-bin
pkgver=1.53.0
pkgrel=1
pkgdesc="Scalable logging solution designed to be fast and highly efficient"
arch=('x86_64' 'aarch64')
url="https://docs.victoriametrics.com/victorialogs/"
license=('Apache-2.0')
backup=('etc/default/victorialogs')
source=("service" "sysusers" "tmpfiles" "default")
source_x86_64=(
    "https://github.com/VictoriaMetrics/VictoriaLogs/releases/download/v${pkgver}/victoria-logs-linux-amd64-v${pkgver}.tar.gz"
    "https://github.com/VictoriaMetrics/VictoriaLogs/releases/download/v${pkgver}/vlutils-linux-amd64-v${pkgver}.tar.gz"
)
source_aarch64=(
    "https://github.com/VictoriaMetrics/VictoriaLogs/releases/download/v${pkgver}/victoria-logs-linux-arm64-v${pkgver}.tar.gz"
    "https://github.com/VictoriaMetrics/VictoriaLogs/releases/download/v${pkgver}/vlutils-linux-arm64-v${pkgver}.tar.gz"
)
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')
sha256sums_x86_64=('55feba89713cafa952673f91b8b38e7701bb0290989263da671b47a0de16edd3'
                   'e72ac62b9e497e415a0b530a95c730a74d5175e5347553775c89997ee2935cf1')
sha256sums_aarch64=('301b7ef12ff9fac7f70b155191affe07ac6212755514174461d775548699ef96'
                    'fd7c6bf56afa3aedc1a4bbb4ba047bc944467faa59715847b9bc252a0ccfecf0')

package(){
  install -Dm755 "${srcdir}/victoria-logs-prod" "${pkgdir}/usr/bin/victorialogs"
  install -Dm755 "${srcdir}/vlogscli-prod" "${pkgdir}/usr/bin/vlogscli"
  install -Dm755 "${srcdir}/vlagent-prod" "${pkgdir}/usr/bin/vlagent"
  install -Dm644 "${srcdir}/service" "${pkgdir}/usr/lib/systemd/system/victorialogs.service"
  install -Dm640 "${srcdir}/default" "${pkgdir}/etc/default/victorialogs"
  install -Dm644 "${srcdir}/sysusers" "${pkgdir}/usr/lib/sysusers.d/victorialogs.conf"
  install -Dm644 "${srcdir}/tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/victorialogs.conf"
}
