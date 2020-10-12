# Contributor: yochananmarqos <mark.wagie@tutanota.com>
# Maintainer:  max.bra <max dot bra at alice dot it>

pkgname=arronax
pkgver=0.8
pkgrel=1
pkgdesc='A program to create and modify starters/launchers (technically: .desktop files) for applications and locations (URLs).'
arch=('any')
license=('GPL3')
url="http://www.florian-diesch.de/software/arronax/"
depends=('gtk3' 'python-gobject' 'python-setuptools' 'python-xdg')
#makedepends=('python-distutils-extra')
optdepends=('python-nautilus: Arronax as Nautilus extension'
            'python-caja: Arronax as Caja extension'
            'nemo-python: Arronax as Nemo extension')

source=(https://launchpad.net/~diesch/+archive/ubuntu/stable/+sourcefiles/arronax/$pkgver/arronax_$pkgver.tar.xz)

md5sums=('fb41dc3515607a45f19f44c9c6e38462')

prepare() {
  # Fix icon location
  cd "$srcdir"/master
  sed -i 's|share/icons/hicolor/{s}x{s}|share/icons/hicolor/{s}x{s}/apps|g' setup.py
}

build() {
  cd "$srcdir"/master
  /usr/bin/python setup.py build
}

package() {
  cd "$srcdir"/master
  /usr/bin/python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

