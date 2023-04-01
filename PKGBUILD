# Maintainer: Benjamin A. Shelton <zancarius@gmail.com>
# Source: https://github.com/zancarius/archlinux-pkgbuilds

pkgname=snuba
pkgver=23.3.1
pkgrel=1
pkgdesc="a service that provides a rich data model on top of Clickhouse"
arch=(any)
url="https://github.com/getsentry/snuba"
license=(BSD)
makedepends=(
    'python-pip'
    'python-setuptools'
)

depends=(
    'python'
)

options=(!strip)
source=(snuba-devserver.service)
sha256sums=('20ecfc39ac9f1ee7fad481c339bc120dce9a3e893fb48c541621e1cfa5422b43')

package() {
    mkdir -p "${pkgdir}/opt/sentry"
    pip install --isolated --root="$pkgdir"/opt/snuba --ignore-installed \
        "setuptools" \
        "https://github.com/getsentry/snuba/archive/refs/tags/$pkgver.tar.gz"

    mkdir -p "${pkgdir}/opt/snuba/.python-eggs"
    find "${pkgdir}" -name '.DS_Store' -delete

    install -Dm0644 "${srcdir}/snuba-devserver.service" "${pkgdir}/usr/lib/systemd/system/snuba-devserver.service"
}
