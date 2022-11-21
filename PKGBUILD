# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Richard Murri <admin@richardmurri.com>
# Contributor: Farhad Shahbazi <farhad@enthusiasm.cc>
# Contributor: Felix Kaiser <felix.kaiser@fxkr.net>

pkgname=python38-bottle
pkgver=0.12.23
pkgrel=1
pkgdesc="A fast and simple micro-framework for small web-applications"
arch=(any)
url="https://bottlepy.org"
license=('MIT')
options=(!emptydirs)
depends=('python38')
makedepends=('python38-setuptools' 'git')
checkdepends=('python38-mako' 'python38-jinja' 'python38-cherrypy' 'python38-twisted'
              'python38-tornado' 'python38-paste' 'python38-gevent' 'python38-eventlet')
source=("$pkgname-$pkgver.tar.gz::https://github.com/defnull/bottle/archive/$pkgver.tar.gz")
sha512sums=('f5c75ab819a492c38baabf299cd7d5f709140afeded598e4e6f76716e03912583c1126f817e3c0fec369bde086a08d21c23a1bf4167820e188ffc2a998b8f484')

check() {
  cd "$srcdir"/bottle-$pkgver
  # https://github.com/bottlepy/bottle/issues/791
  python3.8 test/testall.py || echo "Tests failed"
}

build() {
  cd "$srcdir"/bottle-$pkgver
  python3.8 setup.py build
}

package() {
  cd bottle-$pkgver
  python3.8 setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim: ts=2 sw=2 et:
