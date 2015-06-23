# Contributor: Chris Brannon <cmbrannon79 (at) gmail.com>
# Contributor: joyfulgirl <joyfulgirl (at) archlinux.us>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=edbrowse-git
pkgver=3.5.4.r15.gfd29362
pkgrel=1
pkgdesc="Editor, browser, and mail client based on /bin/ed."
arch=('i686' 'x86_64')
url="http://edbrowse.org/"
license=('GPL' 'openssl')
groups=()
depends=('js>=2.4' 'openssl' 'pcre' 'curl>=7.17.0' 'readline')
makedepends=('git')
provides=('edbrowse')
conflicts=('edbrowse')
replaces=()
backup=()
options=()
install=
source=("$pkgname::git+https://github.com/CMB/edbrowse")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g;s/^v//'
}

build() {
  cd "$srcdir/$pkgname"
  make all
}

package() {
  cd "$srcdir/$pkgname/src"
  make DESTDIR="$pkgdir" prefix=/usr install
  cd ../doc
  # setup.ebrc is a shell script that builds a config file for you. It's in doc/.
  install -m755 setup.ebrc $pkgdir/usr/bin
  install -Dm644 ../doc/man-edbrowse-debian.1 $pkgdir/usr/share/man/man1/edbrowse.1
  mkdir -p $pkgdir/usr/share/doc/edbrowse
  install -Dm644 usersguide.html philosophy.html sample.ebrc $pkgdir/usr/share/doc/edbrowse
}

