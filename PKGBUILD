# Maintainer: Pqolk <tiangloo@outlook.com>

pkgname=azurlaneautoscript
pkgver=2025.01.19
pkgrel=2
pkgdesc="Azur Lane bot (CN/EN/JP/TW) 碧蓝航线脚本 | 无缝委托科研，全自动大世界"
arch=('x86_64')
url="https://github.com/LmeSzinc/AzurLaneAutoScript"
license=('GPL3')
depends=(
  'python'
  'python-pipenv'
  'python-virtualenv'
  'python37'
  'android-tools'
  'git'
)
options=("!debug")
install=${pkgname}.install
source=(
  "$pkgname-v$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
  "${pkgname}.sh"
  "${pkgname}.service"
)
sha256sums=(
  'SKIP'
  'fd253d364680a740812ea00835c76b6dfc14d60c410c536329ea7d6d1873a31e'
  'b26428959edf525e8e59dc99680edef06f4946621d89c8906050a2cef40bce19'
)
package() {
    install -dm755 "${pkgdir}/opt/${pkgname}"
    cp -r "${srcdir}/AzurLaneAutoScript-${pkgver}" "${pkgdir}/opt/${pkgname}/app"
    
    install -dm755 "${pkgdir}/etc/${pkgname}"
    ln -sf "/opt/${pkgname}/app/config/alas.json" "${pkgdir}/etc/${pkgname}/alsa.json"
    ln -sf "/opt/${pkgname}/app/config/deploy.template.yaml" "${pkgdir}/etc/${pkgname}/deploy.template.yaml"

    install -Dm755 azurlaneautoscript.sh "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 azurlaneautoscript.service "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
}
