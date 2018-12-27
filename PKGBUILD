# Maintainer: Davide Depau <davide@depau.eu>
# Maintainer: Raffaele Di Campli <dcdrj.pub@gmail.com>

_pkgname=polibeepsync
pkgname="${_pkgname}"
pkgver=0.4.2
pkgrel=1
pkgdesc="Sync Politecnico di Milano's BeeP files with your PC"
arch=('any')
url='https://jacotsu.github.io/polibeepsync/'
license=('GPL3')
depends=('python' 'python-requests' 'python-appdirs' 'python-pyside2' 'python-beautifulsoup4' 'python-lxml' 'python-pyparsing' 'python-signalslot' 'python-contexter')
makedepends=('git' 'python-setuptools')
conflicts=($_pkgname)
provides=($_pkgname)
source=("git+https://github.com/Jacotsu/polibeepsync.git#tag=$pkgver" "$_pkgname.desktop" "$_pkgname.svg")
sha512sums=('SKIP'
            '2be34458899e0f8cdc7777514226d2e2fb91b70cc5a8f09d632f2958224842335337e5220fca39a7558a855a088c7e109edb8b96606ab6a013a684d055326576'
            'faf89d54fc23b61d52773ea321f0f9522f453632a7abf9ee30889732ea808fec7e7ce282aad8d52a917c30a016e889c741f08c51979db0c2721a3383cf973cde')

prepare() {
  cd "$srcdir/$_pkgname"

  # Works around a bug in Arch Linux's PySide2 package that makes
  # the app fail to start
  sed -i 's/"PySide2",//' setup.py
}

build() {
  cd "$srcdir/$_pkgname"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname"
  python setup.py install --root=${pkgdir} --optimize=1 --skip-build

  cd "$srcdir"
  install -D -m644 $_pkgname.desktop "$pkgdir/usr/share/applications/$_pkgname.desktop"
  install -D -m644 $_pkgname.svg "$pkgdir/usr/share/pixmaps/$_pkgname.svg"
}

