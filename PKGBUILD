#Submitter: Carsten Feuls <archlinux@carstenfeuls.de>

_pkgname=thanos
pkgname=prometheus-$_pkgname
pkgver=0.2.1
pkgrel=2
pkgdesc="Highly available Prometheus setup with long term storage capabilities. (binary, not built from source)"
arch=("x86_64")
url="https://github.com/improbable-eng/thanos"
license=("Apache")
depends=()
makedepends=()
backup=("etc/conf.d/thanos")

source_x86_64=("thanos.service"
               "thanos"
               "https://github.com/improbable-eng/$_pkgname/releases/download/v$pkgver/$_pkgname-$pkgver.linux-amd64.tar.gz")
sha256sums_x86_64=('f94f769c2af513e8dac3bfdb07e290e68f770e0b68778326206d49793a98b3ee'
                   '55e509a5022df1b3af5316e862f048d4815dbba6589d0227e9c8ffdf4f2adfdc'
                   '5feb8488b81e7869abfd3fa92f92a033f68c627cb8a591f1bcc338fee39833b1')

package() {
    cd "${srcdir}/$_pkgname-$pkgver.linux-amd64"

    # Install Binary
    install -D -m0755 thanos "${pkgdir}/usr/bin/thanos"

    # Install SystemD Service File
    install -D -m0644 "${srcdir}/thanos.service" "${pkgdir}/usr/lib/systemd/system/thanos.service"

    # Install thanos config
    install -D -m644 "${srcdir}/thanos" "${pkgdir}/etc/conf.d/thanos"
}
