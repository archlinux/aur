# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-apscheduler
_name=apscheduler
pkgver=3.11.1
pkgrel=1
pkgdesc="In-process task scheduler with Cron-like capabilities"
url="https://github.com/agronholm/apscheduler"
license=('MIT')
arch=('any')
depends=('python-setuptools' 'python-six' 'python-pytz' 'python-tzlocal')
makedepends=("python-build" "python-packaging" "python-wheel" "python-installer")
# python-kazoo, python-pymongo removed due to lack of running service
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
b2sums=('d36901dce5875e7b2bd0788e855e50f601467a28a0156862305f9b69959f64df4c65821d81635fb177580e7f3a91f24e3921509a607c1a46e6e40940767a447b')

build(){
 cd "$_name-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$_name-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
 install -D -m 644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}
