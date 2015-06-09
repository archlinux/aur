# Maintainer: bitwave <aur [aT] oomlu [d0T] de>
# Contributor: fnord0 <fnord0 AT riseup DOT net>
pkgname=('yara' 'python-yara')
pkgbase='yara'
pkgver=3.3.0
pkgrel=2
pkgdesc="a tool aimed at helping malware researchers to identify and classify malware samples"
arch=('i686' 'x86_64')
url="http://plusvic.github.io/yara/"
license=('APACHE')
depends=('openssl')
makedepends=('automake' 'libtool' 'autoconf' 'flex' 'bison')
source=("https://github.com/plusvic/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('f763f4d5b71caf5aef20995d128e1e16f176746dd2fade1f3991a7a81e050ba8c0d9aa1d96bb4dc754e5f0a44fa799d620c5f4797bcd3205fad77f9c493c5532')

build() {
  cd "$srcdir/$pkgbase-$pkgver"
  autoreconf --force --install
  ./configure --prefix=/usr
  make
}

package_yara() {
  cd "$srcdir/$pkgbase-$pkgver"
  make DESTDIR="$pkgdir/" install
  #cp -p "$srcdir/YARA%20User%27s%20Manual%201.6.pdf" "$pkgdir/usr/share/yara/YARA User's Manual 1.6.pdf"
}

package_python-yara() {
  depends=('python' 'yara')
  conflicts=('python2-yara')
  makedepends=('python-setuptools')
  cd "$srcdir/$pkgbase-$pkgver/$pkgbase-python"
  python setup.py install --root="${pkgdir}" --optimize=1
}