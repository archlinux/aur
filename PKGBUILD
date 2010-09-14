# Maintainer: Evangelos Foutras <foutrelis@gmail.com>
# Contributor: Sebastien Binet <binet@lblbox>

pkgname=python-virtualenvwrapper
pkgver=2.5.1
pkgrel=2
pkgdesc="Extensions to Ian Bicking's virtualenv tool"
url="http://www.doughellmann.com/projects/virtualenvwrapper/"
arch=('any')
license=('BSD')
depends=('python-virtualenv')
source=(http://www.doughellmann.com/downloads/virtualenvwrapper-$pkgver.tar.gz)
md5sums=('73afa14ec2798e8b90de426a8265d836')

build() {
  cd "$srcdir/virtualenvwrapper-$pkgver"

  python2 setup.py install --root="$pkgdir" -O1

  # Point Python scripts to the python2 binary
  sed -i 's/which python/which python2/' "$pkgdir/usr/bin/virtualenvwrapper.sh"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  # Extract the license from README.txt
  sed -n '/Copyright/,$ p' README.txt \
    >"$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
