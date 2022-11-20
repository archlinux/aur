# Maintainer: Kyle Keen <keenerd@gmail.com>
# Contributor: Will Shanks <wsha dot code at g mail dot com>

pkgname=python38-ptyprocess
_pkgname=ptyprocess
pkgver=0.7.0
pkgrel=4
pkgdesc="Run a subprocess in a pseudo terminal"
url="https://github.com/pexpect/ptyprocess"
arch=('any')
license=('ISC')
depends=('python38')
makedepends=('python38-setuptools')
source=("https://pypi.io/packages/source/p/$_pkgname/$_pkgname-$pkgver.tar.gz"
        "LIC-pty-$pkgver::https://raw.githubusercontent.com/pexpect/ptyprocess/master/LICENSE")
sha512sums=('791d8f2e79900627215ce80ce67ee9c79173dbc08297c6219d5058f9b80c5e323b93049e6836a70c4073f43548d22e3cf310f2e9948ef12f96bcaa15b0ddb2f3'
            '77465d8319848ad6e4c3811276d6f7f5241f715d1f72012f155f5a1850abc6542fe7a74fcafc39d9801def60884d6d1acc4393700a552e44a05b763ae84970f0')

prepare() {
  cd "$srcdir"
  cp -r $_pkgname-$pkgver ${_pkgname}2-$pkgver
  mv "LIC-pty-$pkgver" LICENSE
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python3.8 setup.py install --root="$pkgdir/" --prefix=/usr --optimize=0
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/python-$_pkgname/LICENSE"
}
