# Maintainer: ybenel <root@ybenel.cf>
# Maintainer: ybenel <root@ybenel.cf>
pkgname=realneptune-cli-git
pkgver=1.0.2
pkgrel=1
pkgdesc="Neptune a superfast mechanical keyboard sound app (CLI git)"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/M1ndo/Neptune"
license=('AGPL3')
makedepends=('go>=1.19')
depends=('make' 'libx11' 'libxtst'
         'libxcb' 'libxkbcommon' 'libxkbcommon-x11' 'alsa-lib'
         'libayatana-appindicator' 'libayatana-indicator'
         'ayatana-ido' 'libdbusmenu-glib' 'gtk3'
         'pango' 'harfbuzz' 'at-spi2-core' 'cairo'
         'gdk-pixbuf2' 'libxrandr' 'libxcursor' 'libxinerama')

source=("https://github.com/M1ndo/Neptune/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2b283dad3de80285b983daab4a5f81dfa0a6fd7621641f89c00a96a1f791944e')

build() {
  export GOPATH="$srcdir"/gopath
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_ENABLED=1

  cd "$srcdir/Neptune-$pkgver"
  make linux-cli
}

package() {
  cd "$srcdir/Neptune-$pkgver"
  make DESTDIR="$pkgdir" install
}
