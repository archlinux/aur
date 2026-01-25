# Maintainer: Sebastian Krzyszkowiak <dos@dosowisko.net>
# Contributor: Kristaps Karlsons <kristaps.karlsons@gmail.com>
# Contributor: Ole Roeßler <ole.roessler@gmail.com>

pkgname=logstalgia
pkgver=1.1.4
pkgrel=2
pkgdesc="a website access log visualisation tool"
url="https://github.com/acaudwell/Logstalgia"
arch=('i686' 'x86_64')
license=('GPL3')
groups=('system')
depends=('pcre' 'sdl2_image' 'ftgl' 'glew' 'glm' 'boost' 'libpng')
source=(https://github.com/acaudwell/Logstalgia/releases/download/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz
        boost-1.89.patch)
sha256sums=('c049eff405e924035222edb26bcc6c7b5f00a08926abdb7b467e2449242790a9'
            'ed3e81179cd6649b449e8f912b7e1d63da005bd5e577055874a8858d7f0c4018')

prepare() {
  cd $pkgname-$pkgver

  patch -p1 < ../boost-1.89.patch

  autoreconf -fiv
}

build() {
  cd $srcdir/$pkgname-$pkgver

  ./configure --prefix=/usr

  make
}

package() {
  cd $srcdir/$pkgname-$pkgver

  make DESTDIR="$pkgdir/" install
}
