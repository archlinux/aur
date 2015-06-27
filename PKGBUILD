# Maintainer: bitwave <aur [aT] oomlu [d0T] de>
# Contributor: fnord0 <fnord0 AT riseup DOT net>
pkgname=('yara' 'python-yara')
pkgbase='yara'
pkgver=3.4.0
pkgrel=1
pkgdesc="a tool aimed at helping malware researchers to identify and classify malware samples"
arch=('i686' 'x86_64')
url="http://plusvic.github.io/yara/"
license=('APACHE')
depends=('openssl')
makedepends=('automake' 'libtool' 'autoconf' 'flex' 'bison')
source=("https://github.com/plusvic/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('27286107882c70de6f2c227d5307fbaa97437f8bbb221d4f0fcb17c4935f65ef01e772c18a14eb814727ca1854f5e3f9f219771706d9f4a748ae9433f475d669')

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