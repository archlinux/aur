# Maintainer: Steven De Bondt <egnappah at gmail dot com>

pkgname=graphite-web
pkgver=1.1.8
pkgrel=1
pkgdesc="Graphite-web, without the interface. Just the rendering HTTP API."
url="https://github.com/graphite-project/graphite-web/"
license=('Apache')
depends=('python-pytz' 'python-six' 'python-flask' 'python-structlog'
         'python-yaml' 'python-tzlocal' 'python-cairocffi' 'python-pyparsing'
         'python-django')
makedepends=('python-setuptools')
optdepends=('python-flask-cache: For caching'
            'python-raven: For sentry support')
arch=('any')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/graphite-project/${pkgname}/archive/${pkgver}.tar.gz"
        "graphite-web.service")
sha256sums=('SKIP'
            '12a8b2449f8a630d66ba37635caae520852936cc9b73adfb1e0985192aa2d522')

build() {
        cd "$srcdir/$pkgname-$pkgver"
        python setup.py build
}

package() {
        cd "$srcdir/$pkgname-$pkgver"
        python setup.py install --root="${pkgdir}/" --optimize=1
        mkdir -p "$pkgdir/var/lib/graphite"
        install -Dm0644 "$srcdir/graphite-web.service" "$pkgdir/usr/lib/systemd/system/graphite-web.service"
}
