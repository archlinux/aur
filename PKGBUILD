# Maintainer: Gokberk Yaltirakli <aur at gkbrk dot com>
# Contributor: Stephanie Wilde-Hobbs (RX14) <steph@rx14.co.uk>

pkgname=mcstatus
pkgver=9.4.2
pkgrel=1
pkgdesc="Provides an easy way to query Minecraft servers for any information they can expose."
arch=(any)
url="https://github.com/py-mine/mcstatus"
license=('Apache')
depends=(python python-six python-click python-dnspython python-asyncio-dgram)
makedepends=()
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('8c4e2534d384f904eef797a8d787be360754df03dd0b5859ab65163caedfd11a')

python_version () {
    python --version | cut -d' ' -f2 | cut -d'.' -f1,2
}

prepare () {
    cd "${srcdir}/mcstatus-${pkgver}"
}

build () {
    cd "${srcdir}/mcstatus-${pkgver}"
}

package () {
    cd "${srcdir}/mcstatus-${pkgver}"
    mkdir -p "${pkgdir}/usr/lib/python$(python_version)/site-packages/"
    mkdir -p "${pkgdir}/usr/bin/"
    cp -r mcstatus/ "${pkgdir}/usr/lib/python$(python_version)/site-packages/"
    printf '#!/bin/sh\npython -m mcstatus $@\n' >> "${pkgdir}/usr/bin/mcstatus"
    chmod +x "${pkgdir}/usr/bin/mcstatus"
}
