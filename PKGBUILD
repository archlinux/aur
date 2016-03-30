# Maintainer: Graviton Research Capital LLP <archlinux@gravitonresearch.com>

pkgname=python-blpapi
pkgver=3.5.5
pkgrel=1
pkgdesc="The Bloomberg API (BLPAPI) is a set of freely available software development kits (SDKs) that allow software developers to create applications that consume market data. Python SDK."
arch=('x86_64')
url="http://www.bloomberglabs.com/"
license=('custom')
depends=('python' 'blpapi_cpp')
source=(http://static.bloomberglabs.com/api/python/blpapi_python_$pkgver.tar.gz)
md5sums=(9ad814bd83d3621f0774352a42d0e2b8)

package() {
  cd "$srcdir/blpapi-$pkgver"
  sed -i -e '/BLPAPI_ROOT/d' -e '/blpapiIncludes/d' -e '/blpapiLibraryPath/d' -e '/if version >= .3\.0.:/,+4d' -e 's/linux2/linux/g' setup.py
  2to3 -nw .
  python setup.py install --root="$pkgdir/" --optimize=1
}
