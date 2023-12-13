# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=linux-ck-autobuild-service
pkgver=0.7.3
pkgrel=1
pkgdesc="A tool to automatically build linux-ck kernels on a headless machines"
arch=(any)
url="https://github.com/nebulosa2007/${pkgname}"
license=(GPL3)
depends=(base-devel bash git)
optdepends=('fzf: for selecting subarches')
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz
        ${pkgname%-service}@.service
        ${pkgname%-service}@.timer)
conflicts=(${pkgname%-service})
sha256sums=('352fbc64bcf68eb45d4d50472481483cb90cce675275331cad3a249c8705c2fd'
            '23f2d1683b91517465b631aa50e0cdf194960704323cfbf1971c45f1a6d71c4f'
            '2d576af5539a77774d6e549f5b62a359ce6dcc12972e94e2d6848eae7388c55d')
package() {
  install -Dm755 ${pkgname}-${pkgver}/${pkgname%-service}       -t ${pkgdir}/usr/bin/
  install -Dm644 ${srcdir}/${pkgname%-service}@.{service,timer} -t ${pkgdir}/usr/lib/systemd/system/
}
