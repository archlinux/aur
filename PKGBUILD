# Contributor: grimi <grimi at poczta dot fm>

pkgname=omnibook-git
pkgver=20150227
pkgrel=1
pkgdesc="Kernel module for HP OmniBook,Pavilion,Toshiba and Compal ACL00 laptops"
arch=('i686' 'x86_64')
url="http://omnibook.sourceforge.net"
license=('GPL')
depends=('linux')
makedepends=('git' 'linux-headers')
conflicts=('omnibook')
provides=('omnibook')
source=("$pkgname::git://devoid-pointer.net/omnibook.git")
md5sums=('SKIP')
install=$pkgname.install



pkgver() {
   cd "$srcdir/$pkgname"
   git log -1 --format="%cd" --date="short"|sed 's|-||g'
}

prepare() {
  cd "$srcdir/$pkgname"
  true
}

build() {
  cd "$srcdir/$pkgname"
  make
  gzip omnibook.ko
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm644 omnibook.ko.gz \
     "$pkgdir"/usr/lib/modules/extramodules-$(uname -r|sed 's/\(.*\)\..*-.*-/\1-/')/omnibook.ko.gz
}


