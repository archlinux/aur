# Maintainer: BGME <i@bgme.me>

pkgname=sing-box-git
_pkgname=sing-box
pkgver=1662477391.ef013e0
pkgrel=1
pkgdesc='The universal proxy platform.'
url='https://sing-box.sagernet.org/'
license=('GPL3')
arch=('x86_64')
makedepends=('git' 'go')
source=('git+https://github.com/SagerNet/sing-box.git'
        'sing-box.service'
        'sing-box@.service')
sha1sums=('SKIP'
          '4cfb0e191924fe10d96efb1cb0738a3bfc14cb3e'
          '868f365bc3752adc55c8783dcfd5b45669f761fa')
sha256sums=('SKIP'
            '2f060289630d02308b95a6a64513d70c97de6a9a96d098d5b2f8d060b58d42f1'
            '14d70b48b9b054733d7095e93d30a253f7c7bcdaadf8ec9ff352f2996c3fde42')

provides=("${_pkgname}")

backup=('etc/sing-box/config.json')

pkgver() {
    cd "${srcdir}/sing-box"
    git log -1 --date=unix --format="%cd.%h"
}

build() {
    cd "${srcdir}/sing-box"
    make build
}

package() {
    pushd "${srcdir}"
        install -Dm 0644 "sing-box.service" "${pkgdir}/usr/lib/systemd/system/sing-box.service"
        install -Dm 0644 "sing-box@.service" "${pkgdir}/usr/lib/systemd/system/sing-box@.service"
    popd

    pushd "${srcdir}/sing-box"
        install -Dm 0755 "sing-box" "${pkgdir}/usr/bin/sing-box"
        install -Dm 0644 "release/config/config.json" "${pkgdir}/etc/sing-box/config.json"
        install -Dm 0644 "LICENSE" "${pkgdir}/usr/share/licenses/sing-box/LICENSE"
    popd
}
