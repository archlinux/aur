# Contributor: Mathieu Clabaut <mathieu.clabaut@gmail.com>
# Maintainer: Eric Anderson <ejona86@gmail.com>

# There's a name clash for the Python 3 version
#pkgname=('python2-cliapp' 'python-cliapp')
pkgname=('python2-cliapp')
pkgver=1.20180812.1
pkgrel=1
pkgdesc='Python framework for Unix-like command line programs'
arch=('any')
url="https://liw.fi/cliapp/"
license=('GPL2')
makedepends=('python2' 'python2-yaml' 'python' 'python-yaml')
source=("https://code.liw.fi/debian/pool/main/p/python-cliapp/python-cliapp_$pkgver.orig.tar.xz")
sha256sums=('e3e6e1babd86de617f70b651fafc2b21fc9c104ca7294778bee88187ac9f7f8f')

# 1.20180812.1 has a tarbomb archive
noextract=("python-cliapp_$pkgver.orig.tar.xz")
prepare() {
  cd "$srcdir"
  mkdir "python-cliapp-$pkgver"
  bsdtar -xf "python-cliapp_$pkgver.orig.tar.xz" -C "python-cliapp-$pkgver"
}

build() {
  cd "$srcdir/python-cliapp-$pkgver"
  python setup.py build
}

package_python2-cliapp() {
depends=('python2' 'python2-yaml')
  cd "$srcdir/python-cliapp-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

package_python-cliapp() {
depends=('python' 'python-yaml')
  cd "$srcdir/python-cliapp-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
