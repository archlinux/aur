# Maintainer: Isaac True <isaac.true@gmail.com>
# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: David Campbell <davekong@archlinux.us>
# Contributor: Cilyan Olowen <gaknar@gmail.com>

_pkgname=PasteDeploy
pkgname=python2-paste-deploy
pkgver=1.5.2
pkgrel=2
pkgdesc="Load, configure, and compose WSGI applications and servers"
arch=(any)
license=(custom)
depends=(python2)
makedepends=(python2-setuptools)
source=(https://pypi.python.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('d5858f89a255e6294e63ed46b73613c56e3b9a2d82a42f1df4d06c8421a9e3cb')
sha512sums=('03147b2e735f4504b928066d35f46e7d19a49b85afc506b793fba69c8827a4d5b8185074bdd4a963ac392cc104f5a608d1db9a3538d7d3239da5febcbff4ccab')

prepare() {
   find $_pkgname-$pkgver -name '*.py' -type f -exec sed -ri 's:^#!/usr/bin/(env )?python$:&2:' '{}' \;
}

build() {
   cd $_pkgname-$pkgver/
   python2 setup.py build
}

package() {
   cd $_pkgname-$pkgver/
   python2 setup.py install --root="$pkgdir" --optimize=1
   install -Dm644 docs/license.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

