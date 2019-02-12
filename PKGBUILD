#Submitter: Carsten Feuls <archlinux@carstenfeuls.de>

_pkgname=thanos
pkgname=prometheus-$_pkgname
pkgver=0.2.1
pkgrel=4
pkgdesc="Highly available Prometheus setup with long term storage capabilities. (binary, not built from source)"
arch=("x86_64")
url="https://github.com/improbable-eng/thanos"
license=("Apache")
depends=()
makedepends=()
backup=("etc/conf.d/thanos")

source_x86_64=("thanos.service"
               "thanos.conf"
               "thanos.sysuser"
               "https://github.com/improbable-eng/$_pkgname/releases/download/v$pkgver/$_pkgname-$pkgver.linux-amd64.tar.gz")
sha256sums_x86_64=('a93cfdbf7585322a8cc643aafefcd83f0e666d5d5596d5a999a2488313bb1215'
                   'e0d582d721b99920a22153aac2361e300a3ec0cb05e92ecd9ee77c65b73d300a'
                   'b4655816e604a742a15bc008c876674dd9972578d36f25a07c20c5dee39f7dc0'
                   '5feb8488b81e7869abfd3fa92f92a033f68c627cb8a591f1bcc338fee39833b1')

package() {
    cd "${srcdir}/$_pkgname-$pkgver.linux-amd64"

    # Install Binary
    install -D -m0755 thanos "${pkgdir}/usr/bin/thanos"

    # Install SystemD Service File
    install -D -m0644 "${srcdir}/thanos.service" "${pkgdir}/usr/lib/systemd/system/thanos@.service"
    install -D -m0644 "${srcdir}/thanos.sysuser" "${pkgdir}/usr/lib/sysusers.d/thanos.conf"

    install -d -m0644 "${pkgdir}/etc/thanos/"


    # Install thanos config
    install -D -m644 "${srcdir}/thanos.conf" "${pkgdir}/etc/thanos/sidecar.conf"
    install -D -m644 "${srcdir}/thanos.conf" "${pkgdir}/etc/thanos/store.conf"
    install -D -m644 "${srcdir}/thanos.conf" "${pkgdir}/etc/thanos/query.conf"
    install -D -m644 "${srcdir}/thanos.conf" "${pkgdir}/etc/thanos/rule.conf"
    install -D -m644 "${srcdir}/thanos.conf" "${pkgdir}/etc/thanos/compact.conf"
}
