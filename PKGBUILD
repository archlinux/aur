# Maintainer: Brian Gomes Bascoy <+@peramid.es>
_pkgname=apicula
pkgname=$_pkgname-git
pkgver=0.14.r12.gf038d32
pkgrel=1
pkgdesc="Project Apicula bitstream documentation for Gowin FPGAs"
arch=('i686' 'x86_64')
url="https://github.com/YosysHQ/apicula"
license=('MIT')
depends=('python>=3.8' 'python-numpy' 'python-pandas' 'python-pillow' 'python-crc' 'python-openpyxl')
makedepends=('python-setuptools')
conflicts=('prjapicula')
provides=("$_pkgname=$pkgver")
source=('apicula::git+https://github.com/YosysHQ/apicula.git'
        'https://github.com/YosysHQ/apicula/releases/download/0.0.0.dev/linux-x64-gowin-data.tgz')
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd "$srcdir/apicula"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/apicula"
  python setup.py build
}

package() {
  cd "$srcdir/apicula"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  cp -r "${srcdir}/apycula" "${pkgdir}/$(python3 -c 'import sysconfig; print(sysconfig.get_paths()["purelib"])')"
}

# vim:set ts=2 sw=2 et:
