# Maintainer: BGME <i@bgme.me>

pkgname=sing-box-git
_pkgname=sing-box
pkgver=1661522026.3ea59d9
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
          '5900521478dfa3ebe97248ef84af3882af8e020b'
          '573c078483a3ddbb5a8491a0e03054192b0bab7f')
sha256sums=('SKIP'
            '872bcc90ff9c683831ca2033aee721e8af91d64e244cc650f1929a15f517fc09'
            'e1ae86ceb758c5967745737f1bbb61201061e2bf1ac4d47a42fe9d7ac4d7ffde')

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
