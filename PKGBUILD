# Maintainer: Jose Riha <jose 1711 gmail com>
# Contributor: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>
# Contributor: veox <veox at wemakethings dot net>
# Contributor: Morten Linderud <foxboron@archlinux.org>
# Contributor: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: Anatol Pomozov

pkgname=python2-autobahn
pkgver=19.11.2
pkgrel=1
pkgdesc='Real-time framework for Web, Mobile & Internet of Things'
arch=(any)
url='https://crossbar.io/autobahn/'
license=(MIT)
depends=(python2-twisted python2-six python2-txaio python2-trollius python2-wsaccel)
makedepends=(python2-setuptools python2-msgpack python2-pynacl python2-trollius python2-cryptography)
checkdepends=(python2-mock python2-pytest)
optdepends=(
  'python2-msgpack: MsgPack serializer support'
  'python2-pynacl: WAMP-cryptosign support'
)
source=(https://pypi.io/packages/source/a/autobahn/autobahn-$pkgver.tar.gz)
sha256sums=('64fa063b3a1ab16588037d4713f13f66167f7ad2a2e95fd675decbc3bc85c089')


build() {
  cd "$srcdir/autobahn-$pkgver"
  AUTOBAHN_USE_NVX=1 python2 setup.py build
}

package() {

  cd "$srcdir/autobahn-$pkgver"
  AUTOBAHN_USE_NVX=1 python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  mv "$pkgdir/usr/bin/wamp" "$pkgdir/usr/bin/wamp2"
}
