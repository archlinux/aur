# Maintainer: Filipe Laíns (FFY00) <filipe.lains@gmail.com>
pkgname=pylms7002soapy-git
_pkgname=pyLMS7002Soapy
pkgver=r2.ea230dc
pkgrel=1
pkgdesc="Python bindings for LMS7002M with SoapySDR backend"
arch=('any')
url="https://github.com/myriadrf/pyLMS7002Soapy"
license=('Apache')
makedepends=('git')
provides=('pylms7002soapy')
conflicts=('pylms7002soapy')
source=("git+$url")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir"/$_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir"/$_pkgname
  python2 setup.py build
}

package() {
  cd "$srcdir"/$_pkgname
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build

  mkdir -p "$pkgdir"/usr/share/$_pkgname
  cp -dr --no-preserve=ownership examples/ "$pkgdir"/usr/share/$_pkgname/
}
