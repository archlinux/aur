# Contributor: Chris Brannon <cmbrannon79 (at) gmail.com>
# Contributor: joyfulgirl <joyfulgirl (at) archlinux.us>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=edbrowse-git
pkgver=3.6.2.r40.g9d868ba
pkgrel=1
pkgdesc="A line-oriented editor, browser and mail client."
arch=('i686' 'x86_64')
url="http://edbrowse.org/"
license=('GPL' 'openssl')
groups=()
depends=('js>=2.4' 'openssl' 'pcre' 'curl>=7.17.0' 'readline' 'tidy-html5-git')
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
  install -Dm644 ../doc/man-edbrowse-debian.1 $pkgdir/usr/share/man/man1/edbrowse.1
  mkdir -p $pkgdir/usr/share/doc/${pkgname%-*}
  install -Dm644 ../doc/usersguide.html ../doc/sample.ebrc ../README $pkgdir/usr/share/doc/${pkgname%-*}
  install -Dm644 ../COPYING $pkgdir/usr/share/licenses/${pkgname%-*}/COPYING
}

