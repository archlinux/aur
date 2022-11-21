# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Thomas S Hatch <thatch45@gmail.com>

pkgname=python38-pyftpdlib
pkgver=1.5.7
pkgrel=2
pkgdesc='Very fast asynchronous FTP server library'
arch=('any')
url='https://github.com/giampaolo/pyftpdlib/'
license=('MIT')
depends=('python38')
optdepends=('python38-pyopenssl: FTPS support'
            'python38-psutil: to keep track of FTP server memory usage')
makedepends=('python38-setuptools' 'python38-pysendfile')
checkdepends=('python38-pytest' 'python38-pyopenssl' 'python38-psutil')
source=("https://pypi.io/packages/source/p/pyftpdlib/pyftpdlib-$pkgver.tar.gz")
sha512sums=('66ad5a1ab8fde26233250351f553cdc411303616d717c416cdce059f93c64e6ef64c7707103644583249b6aba22a9841994b38e731edc7997e95e266dbdbdc22')

build() {
  cd pyftpdlib-$pkgver
  python3.8 setup.py build
}

check() {
  cd pyftpdlib-$pkgver
  pytest
}

package() {
  cd pyftpdlib-$pkgver
  python3.8 setup.py install --root="$pkgdir" -O1
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
