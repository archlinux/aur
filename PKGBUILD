# Contributor: Roberto Nobrega <rwnobrega@gmail.com>
# Contributor: max.bra <max dot bra at alice dot it>

pkgname=gnome-gmail
pkgver=2.2
_pkgbranch=master
pkgrel=2
pkgdesc="It allows desktop mail actions, such as 'Send File as Email' or web 'mailto' links, to be handled by the Gmail web client."
arch=('any')
url="https://davesteele.github.io/gnome-gmail/index.html"
license=('GPL2')
depends=('python-gobject' 'python2-gnomekeyring' 'desktop-file-utils' 'python-setuptools' 'python-xdg' 'python-six' 'libwnck3')
optdepends=('nautilus-sendto: automatically upload an email with a file attachment from nautilus')
makedepends=('python-distutils-extra')
source=(https://github.com/davesteele/gnome-gmail/archive/master/$pkgver.tar.gz
        https://github.com/davesteele/gnome-gmail/commit/802e59543229359b3f383ccd6b31951280a4d992.diff)
md5sums=('3a5b983c75eff3f5ce638aba28b2694f'
         '79df46e65a83869f28a08aa8894699ef')
install=$pkgname.install

prepare() {
  cd "$srcdir"/$pkgname-$_pkgbranch-$pkgver
  # patch for bug 29 until official release
  patch -p1 < ../802e59543229359b3f383ccd6b31951280a4d992.diff
}

build() {
  cd "$srcdir"/$pkgname-$_pkgbranch-$pkgver
  /usr/bin/python ./setup.py build
}

package() {
  cd "$srcdir"/$pkgname-$_pkgbranch-$pkgver
  /usr/bin/python ./setup.py install --root="$pkgdir"
}

