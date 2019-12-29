# Maintainer: DJ Lucas <dj@linuxfromscratch.org>

pkgname=('python-doh-proxy')
pkgver=0.0.9
pkgrel=1
pkgdesc="Client and server software to query DNS over HTTPS, using Google DNS-over-HTTPS protocol"
pkgrelname='doh-proxy'
url="https://github.com/facebookexperimental/${pkgrelname}"
arch=('x86_64')
license=('BSD')
install=doh-proxy.install
makedepends=('python>=3.7')
depends=('python-aioh2'
         'python-aiohttp'
         'python-aiohttp_remotes'
         'python-dnspython')
backup=('etc/conf.d/doh-httpproxy'
        'etc/conf.d/doh-proxy'
        'etc/conf.d/doh-stub')
source=("$url/archive/v$pkgver.tar.gz"
        'doh-httpproxy.confd'
        'doh-httpproxy.service'
        'doh-proxy.confd'
        'doh-proxy.service'
        'doh-stub.confd'
        'doh-stub.service')
sha256sums=('d8d0e4ae9e34a0394395463b209c76f60cb8e8056b38f855aa217ad7af8c2873'
            '41da4dc7e2dc92f75f205ae3302f4af6ac6ea7010cb18da788b02bece8a203de'
            'd637e19f8412c0ebfea4f2eb20a594d57b1e2fdce386505c974c27de190c124b'
            '48bc8a1b0f2ba0f4181e5c1ad28214e6c89670652f0bc9b93234cd49e522984b'
            'a08214e85ce485f4d2964c8d9943b30c92cd9353d19e31ddbc571c3cfb70846d'
            '2996a6d996aee85852757b577ca462460b7c8989dd0d97aa71a68a423209de76'
            '83df49c7ea461a71e9b63fae437fba3c4dd03048ba3d99c3022e75c866606a8a')

build() {
    cd "${srcdir}/${pkgrelname}-${pkgver}"
    python3 setup.py build
}

package() {
    cd "${srcdir}/${pkgrelname}-${pkgver}"
    python3 setup.py install --root="${pkgdir}"
    install -vdm755 "${pkgdir}/usr/lib/systemd/system"
    install -vdm755 "${pkgdir}/etc/conf.d"
    install -vm644 "${srcdir}/doh-httpproxy.confd" \
                   "${pkgdir}/etc/conf.d/doh-httpproxy"
    install -vm644 "${srcdir}/doh-proxy.confd" \
                   "${pkgdir}/etc/conf.d/doh-proxy"
    install -vm644 "${srcdir}/doh-stub.confd" \
                   "${pkgdir}/etc/conf.d/doh-stub"
    install -vm644 "${srcdir}/doh-httpproxy.service" \
                   "${pkgdir}/usr/lib/systemd/system/"
    install -vm644 "${srcdir}/doh-proxy.service" \
                   "${pkgdir}/usr/lib/systemd/system/"
    install -vm644 "${srcdir}/doh-stub.service" \
                   "${pkgdir}/usr/lib/systemd/system/"
}
# vim:set ts=4 sw=4 et:
