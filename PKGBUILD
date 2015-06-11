# Maintainer: Masami Ichikawae <masami256@gmail.com>
# vim:set ts=2 sw=2 et filetype=sh:
pkgname=python2-locust-git
_pkgname=locust
pkgver=v0.7.2.r33.g5e9c300
pkgrel=1
pkgdesc="An easy-to-use, distributed, user load testing tool."
arch=('any')
url="http://locust.io/"
license=('MIT')
depends=('python2-gevent>=1.0.1' 'python2-flask>=0.10.1' 'python2-requests>=2.4.1' 'python2-msgpack>=0.4.2')
makedepends=('git')
source=('git://github.com/locustio/locust.git')
md5sums=('SKIP') # skip git source checksum

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    cd $srcdir/$_pkgname
    python2 setup.py build
}

package() {
    cd $srcdir/$_pkgname
    python2 setup.py install --root=${pkgdir}/ --optimize=1

    install -D -m 644 -o root -g root "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

