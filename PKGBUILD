# Contributor: yochananmarqos <mark.wagie@tutanota.com>
# Maintainer:  max.bra <max dot bra dot gtalk at gmail dot com>

pkgname=arronax
pkgver=0.8.1
pkgrel=1
pkgdesc='A program to create and modify starters/launchers (technically: .desktop files) for applications and locations (URLs).'
arch=('any')
license=('GPL3')
url="http://www.florian-diesch.de/software/arronax/"
depends=('libwnck3' 'python-gobject' 'python-pyxdg')
makedepends=('python-setuptools')
optdepends=('python-nautilus: Arronax as Nautilus extension'
            'python-caja: Arronax as Caja extension'
            'nemo-python: Arronax as Nemo extension')

source=(https://www.florian-diesch.de/software/arronax/dist/arronax-$pkgver.tar.gz)

md5sums=('de079a182806ed3b6626656605a1214c')

prepare() {
  # Fix icon location
  cd "$srcdir"/$pkgname-$pkgver
  sed -i 's|share/icons/hicolor/{s}x{s}|share/icons/hicolor/{s}x{s}/apps|g' setup.py
}

build() {
  cd "$srcdir"/$pkgname-$pkgver
  /usr/bin/python setup.py build
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  /usr/bin/python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

