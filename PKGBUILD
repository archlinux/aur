# Contributor: Johannes Dewender   arch at JonnyJD dot net
pkgname=distro-info
_python=python3
pkgver=1.4
pkgrel=1
pkgdesc="provides information about the distributions' releases"
arch=('i686' 'x86_64')
url="http://packages.debian.org/sid/distro-info"
license=('MIT')
depends=('distro-info-data>=0.56')
makedepends=('shunit2' 'perl' 'python-setuptools' 'python2-setuptools' 'python-pylint')
provides=('python-distro-info' 'python3-distro-info' 'perl-distro-info')
conflicts=('python-distro-info' 'python3-distro-info' 'perl-distro-info')
options=(!emptydirs)
source=(http://ftp.debian.org/debian/pool/main/d/$pkgname/${pkgname}_$pkgver.tar.xz)
sha256sums=('d5c77a199a5287fd18afb0f32377b3516d680f60e055d18a9fea423ceb2e4c27')

build() {
  #cd "$srcdir/$pkgname-$pkgver"
  cd "$srcdir/$pkgname"
  sed -i -e 's/ --install-layout=deb//g' Makefile
  make
}
check() {
  #cd "$srcdir/$pkgname-$pkgver"
  cd "$srcdir/$pkgname"
  make test-commandline
  make test-perl
  cd python
  # We don't want to test all installed python versions -> don't use "make test"
  # additionally the pylint and flake8 tests seem to fail currently
  #for pythonver in {python2,python}; do
  #  $pythonver setup.py test
  #done
}
package() {
  #cd "$srcdir/$pkgname-$pkgver"
  cd "$srcdir/$pkgname"
  # vendor can currently be only ubuntu or debian
  # with ubuntu you can build for PPA (with bzr-builddeb)
  make DESTDIR="$pkgdir/" VENDOR="ubuntu" install
}

# vim:set ts=2 sw=2 et:
