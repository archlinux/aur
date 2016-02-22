# Maintainer: Markus Kitsinger (SwooshyCueb) <root@swooshalicio.us>
pkgname=python-camel
pkgver=v0.1.r11.g8e3abfe
pkgrel=2
pkgdesc='Python serialization module'
arch=(any)
license=(ISC)
url="https://github.com/eevee/camel"
depends=(python-yaml)
source=(git+https://github.com/eevee/camel.git)
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/camel"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare () { # (Hopefully) temporary workaround to get python 3 builds to work
  cd "$srcdir/camel"
  sed -i "s/—/-/g" README.txt
}

package ()
{
  cd "$srcdir/camel"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

