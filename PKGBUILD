# Maintainer: Mike Nagie <echo 'cHJvbWlrZTE5ODdAZ21haWwuY29tCg==' | base64 -d>
# Maintainer: Ingo Gottwald <in dot gottwald at gmail dot com>
# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: BluePeril <blueperil (at) blueperil _dot_ de>

pkgname=python2-eventlib
pkgver=0.2.3
pkgrel=1
pkgdesc="Coroutine-based networking library"
arch=('any')
url="http://www.icanblink.com"
license=('custom:MIT')
depends=('python2-greenlet' 'python2-pyopenssl')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/AGProjects/python-eventlib/archive/release-$pkgver.tar.gz")

build() {
  cd "$srcdir/${pkgname/2}-release-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/${pkgname/2}-release-$pkgver"
  python2 setup.py install --root="$pkgdir/"

  # python2 fix
  sed -i "s|bin/python|&2|" `grep -rl bin/python "$pkgdir"`

  # license
  install -Dm644 debian/copyright \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
sha256sums=('a6c6a869ddd3f60e8823aeb199d23c6be86e4e203438269759600cb8c2c519aa')
