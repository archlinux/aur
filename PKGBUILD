# Maintainer: 0x9fff00 <0x9fff00+git@protonmail.ch>
# Contributor: Christoph Stahl <christoph.stahl@uni-dortmund.de>
# Contributor: Serge Victor <arch@random.re>

_pipname=Flask-APScheduler
_reponame=${_pipname,,}
pkgname=python-$_reponame
pkgver=1.11.0
pkgrel=3
pkgdesc='Adds APScheduler support to Flask'
arch=('any')
url="https://github.com/viniciuschiele/$_reponame"
license=('Apache')
depends=('python' 'python-apscheduler' 'python-dateutil' 'python-flask')
makedepends=('python-setuptools')
source=("$url/releases/download/$pkgver/$_pipname-$pkgver.tar.gz"
        '0001-Don-t-install-LICENSE-file.patch')
sha256sums=('7911d66e449f412d92a1a6c524217f44f4c40a5c92148c60d5189c6c402f87d0'
            '353a85fdcc9d8eee32fb7990155974eb30c8c79fe851a2fa6de700aaf59d8fb7')

prepare() {
  cd "$_pipname-$pkgver"

  for p in "$srcdir"/*.patch; do
    patch -Np1 -i "$p"
  done
}

build() {
  cd "$_pipname-$pkgver"

  python setup.py build
}

package() {
  cd "$_pipname-$pkgver"

  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
