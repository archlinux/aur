# Maintainer: Phillip Smith <pkgbuild@phs.id.au>
# http://github.com/fukawi2/aur-packages

pkgname=quickrdp
pkgver=2.4.3
pkgrel=2
pkgdesc="Connection manager program for your remote desktop, telnet, SSH or VNC connections."
arch=('i686' 'x86_64')  # untested on i686; please let me know if it works
url="https://github.com/arnestig/quickrdp"
license=('GPL3')
depends=('wxgtk' 'curl')
optdepends=('rdesktop: remote desktop support')
source=("$pkgname-$pkgver.tar.gz::https://github.com/arnestig/quickrdp/archive/$pkgver.tar.gz"
        'gcc6-fix.patch')
md5sums=('e9d7c6863c2081f0a4dab43712a6fccb'
         'acdd61e400a0f089ebe08ad8ae29580b')

prepare() {
  cd "$srcdir"/$pkgname-$pkgver
  patch -Np1 -i "$srcdir"/gcc6-fix.patch
}

build() {
  cd "$srcdir"/$pkgname-$pkgver

  CFLAGS="-march=x86-64 -mtune=generic -O2 -pipe -fstack-protector-strong"
  CXXFLAGS="-march=x86-64 -mtune=generic -O2 -pipe -fstack-protector-strong"
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
