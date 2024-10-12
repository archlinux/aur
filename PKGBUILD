# Maintainer: Gokberk Yaltirakli <aur at gkbrk dot com>
# Contributor: Stephanie Wilde-Hobbs (RX14) <steph@rx14.co.uk>

pkgname=mcstatus
pkgver=11.1.1
pkgrel=1
pkgdesc="Provides an easy way to query Minecraft servers for any information they can expose."
arch=(any)
url="https://github.com/py-mine/mcstatus"
license=('Apache')
depends=(python python-dnspython python-asyncio-dgram)
makedepends=()
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('ebaa03d69ef78f3719ff3506228be4b24304966d040b9aa4630edc0fcf018eb6')

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
