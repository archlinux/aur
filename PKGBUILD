# Maintainer: 0x9fff00 <0x9fff00+git@protonmail.ch>
# Contributor: Christoph Stahl <christoph.stahl@uni-dortmund.de>
# Contributor: Serge Victor <arch@random.re>

_pipname=Flask-APScheduler
_reponame=${_pipname,,}
pkgname=python-$_reponame
pkgver=1.12.0
pkgrel=1
pkgdesc='Adds APScheduler support to Flask'
arch=('any')
url="https://github.com/viniciuschiele/$_reponame"
license=('Apache')
depends=('python' 'python-apscheduler' 'python-dateutil' 'python-flask')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
        '0001-Don-t-install-LICENSE-file.patch')
sha256sums=('c65dd3287fa8a8985071c6dac1369495f5ad53065c06cc35638ed85b46200d02'
            'cc851fa535e506092c4901d2042e5f9b0ac2e6933808d6176825fc172e3498ba')

prepare() {
  cd "$_reponame-$pkgver"

  for p in "$srcdir"/*.patch; do
    patch -Np1 -i "$p"
  done
}

build() {
  cd "$_reponame-$pkgver"

  python setup.py build
}

package() {
  cd "$_reponame-$pkgver"

  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
