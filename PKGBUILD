# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Ekin Dursun <ekindursun@gmail.com>

pkgname=python-mpv
pkgver=1.0.3
pkgrel=2
pkgdesc='Python interface to the awesome mpv media player'
arch=('any')
url=https://github.com/jaseg/python-mpv
_url_pypi=https://pypi.org/project/python-mpv
license=('GPL' 'LGPL')
depends=('mpv' 'python')
makedepends=('python-build' 'python-installer' 'python-setuptools'
             'python-wheel')
checkdepends=('python-pytest' 'python-xvfbwrapper')
optdepends=('python-pillow: for raw screenshot support')
source=("https://github.com/jaseg/$pkgname/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('0701147415c920be4ec65151ed7844bb36c275bcc64ae07d4ece9a515a96ba09097a8f2282eb7bbb74e8dc143d14f9a0aebdfadad53e0e9e4d62fcde734c7d17')

build() {
  cd $pkgname-$pkgver
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd $pkgname-$pkgver
  pytest
}

package() {
  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 'README.rst' -t "$pkgdir"/usr/share/doc/$pkgname
}
