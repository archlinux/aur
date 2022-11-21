# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-fs
pkgver=2.4.16
pkgrel=1
pkgdesc="Filesystem abstraction layer"
arch=('any')
license=('BSD')
url="https://pypi.python.org/pypi/fs/"
depends=('python38-appdirs' 'python38-pytz' 'python38-setuptools' 'python38-six')
checkdepends=('python38-pytest-runner' 'fuse2' 'python38-pyftpdlib' 'python38-psutil' 'python38-pysendfile'
              'python38-parameterized')
source=("https://github.com/PyFilesystem/pyfilesystem2/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('24a50fdbb668916e19ef26b21feb345beb6d734e841435de2bef32672e4f6b8329a44e827b6d3bb878c2522098499dea4915adcfa381b0a3c9e20f8c4f7352bb')

build() {
  cd pyfilesystem2-$pkgver
  python3.8 setup.py build
}

check() {
  cd pyfilesystem2-$pkgver
  python3.8 setup.py install --root="$PWD/tmp_install" --optimize=1
  PYTHONPATH="$PWD/tmp_install/usr/lib/python3.8/site-packages:$PYTHONPATH" python setup.py pytest
}

package() {
  cd pyfilesystem2-$pkgver
  python3.8 setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
