# Maintainer: Philipp Schmitt <philipp@schmitt.co>
# GitHub: https://github.com/pschmitt/aur-python-crontab

_name=python-crontab
pkgname=('python-crontab' 'python2-crontab')
pkgver=2.2.4
pkgrel=2
pkgdesc='Crontab module for read and writing crontab files and accessing the system cron automatically and simply using a direct API.'
arch=('any')
url='https://pypi.python.org/pypi/python-crontab'
license=('GPL')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")

md5sums=('f0b3140d3db5150d9e01bf7f30abb602')

prepare()
{
  cp -a ${pkgname}-$pkgver{,-py2}
}

build()
{
  cd "$srcdir/${pkgname}-$pkgver"
  python setup.py build

  cd "$srcdir/${pkgname}-$pkgver-py2"
  python2 setup.py build
}

package_python-crontab ()
{
  depends=('python' 'python-dateutil')
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

package_python2-crontab ()
{
  depends=('python2' 'python2-dateutil')
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
