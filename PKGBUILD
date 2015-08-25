# Maintainer: Jamie Tanna <jamie@jamietanna.co.uk>
# Contributor: Alexander Schneider <sailerboy>

pkgname=i3lock-background
pkgver=2.4.1
pkgrel=1
pkgdesc="An improved screenlocker based upon XCB and PAM with better handling of image scaling and centering on multiple monitors."
arch=('i686' 'x86_64')
url="https://github.com/jaseg/i3lock"
license=('MIT')
depends=('xcb-util-image' 'pam' 'libev' 'cairo' 'libxkbcommon' 'libxkbfile')
provides=('i3lock')
conflicts=('i3lock')
makedepends=('git')
source=(git://github.com/jaseg/i3lock.git)
sha1sums=('SKIP')

_gitname="i3lock"

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --tags | sed 's/-/./g'
}

build() {
  cd "$_gitname"
  make
  gzip i3lock.1
}


package() {  
  cd "$_gitname"

  make DESTDIR="$pkgdir" install
  
  install -Dm644 i3lock.1.gz ${pkgdir}/usr/share/man/man1/i3lock.1.gz
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

  make clean
}

# vim:set ts=2 sw=2 et:

