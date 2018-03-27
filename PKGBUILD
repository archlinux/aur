# Maintainer: Sonic-Y3k <sonic.y3k@googlemail.com>

pkgname=tvhproxy-git
pkgdesc='A small flask app to proxy requests between Plex Media Server and Tvheadend.'
pkgver=r28.08096e6
pkgrel=3
arch=('any')
url=https://github.com/jkaberg/tvhProxy
license=('unknown')
provides=('tvhproxy')
makedepends=()
depends=('python-flask' 'python-requests' 'python-gevent')
source=("${pkgname}::git+https://github.com/jkaberg/tvhProxy"
        'tvhproxy.service'
        'tvhProxy.conf.d')
sha256sums=('SKIP'
            '2917aaec1c1d3e05373f8713bc6249d863e2eaf1bdd1596f0a0f7bd424de8c80'
            'c31c5c0abb243db6b0ae0c395dd1f56eab49a5c1ee7e29a12ccf05941afe3214')

pkgver() {
    cd "${srcdir}/${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "${srcdir}/${pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/tvhproxy/LICENSE"
    install -Dm755 tvhProxy.py "${pkgdir}/usr/lib/tvhproxy/tvhProxy.py"
    install -Dm644 "${srcdir}/tvhproxy.service" "${pkgdir}/usr/lib/systemd/system/tvhProxy.service"
    install -Dm644 "${srcdir}/tvhProxy.conf.d" "${pkgdir}/etc/conf.d/tvhProxy"
    msg "Don't forget to configure /etc/conf.d/tvhProxy."
}