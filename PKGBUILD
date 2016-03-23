# Maintainer: Benjamin A. Shelton <zancarius@gmail.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>
# Source: https://github.com/zancarius/archlinux-pkgbuilds

pkgname=python2-gevent-socketio
pkgver=0.3.6
pkgrel=3
pkgdesc="SocketIO server based on the gevent pywsgi server, a Python network library."
arch=(any)
url="http://pypi.python.org/pypi/gevent-socketio"
license=(BSD)
depends=(python2 python2-gevent python2-gevent-websocket)
makedepends=(python2-setuptools)
source=(
    "https://pypi.python.org/packages/source/g/gevent-socketio/gevent-socketio-${pkgver}.tar.gz"
    'gevent-110-no-int-header.patch'
)
md5sums=(
    33f745d74885366a07da516c000854b6
    87a9efb9d61ebca90810901d708ae9e2
)

package () {
    cd "${srcdir}/gevent-socketio-${pkgver}"

    # Workaround for https://github.com/abourget/gevent-socketio/issues/223
    # as reported by Alan Beale.
    #
    # References:
    # https://github.com/abourget/gevent-socketio/pull/221
    # https://github.com/abourget/gevent-socketio/pull/237
    patch -p1 -i ../gevent-110-no-int-header.patch

    python2 setup.py install --root="${pkgdir}/" --optimize=1
    install -Dm0644 "${srcdir}/gevent-socketio-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
