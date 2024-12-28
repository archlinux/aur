# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-apscheduler
_name=apscheduler
pkgver=3.11.0
pkgrel=1
pkgdesc="In-process task scheduler with Cron-like capabilities"
url="https://github.com/agronholm/apscheduler"
license=('MIT')
arch=('any')
depends=('python-setuptools' 'python-six' 'python-pytz' 'python-tzlocal')
makedepends=("python-build" "python-packaging" "python-wheel" "python-installer")
# python-kazoo, python-pymongo removed due to lack of running service
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
b2sums=('1c18a3779f73a6efaaa92e9a12bd34afaa4afbbeed76bf20b07a2eb9dbb11740e7e6d0f2a94bdd6c8a7ad16ea4db855ccce8a9dc007aa6da7d91b7362af90753')

build(){
 cd "$_name-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$_name-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
 install -D -m 644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}
