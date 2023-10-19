# Maintainer: Alien X <alienx@AlienX>
# Maintainer: Alien X <alienx@AlienX>
pkgname=realneptune-git
pkgver=1.0.1
pkgrel=1
pkgdesc="Neptune a superfast mechanical keyboard sound app (git)"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/M1ndo/Neptune"
license=('AGPL3')
makedepends=('go>=1.19')
depends=('make' 'libx11' 'libxtst'
         'libxcb' 'libxkbcommon' 'libxkbcommon-x11' 'alsa-lib'
         'libayatana-appindicator' 'libayatana-indicator'
         'ayatana-ido' 'libdbusmenu-glib' 'gtk3'
         'pango' 'harfbuzz' 'at-spi2-core' 'cairo'
         'gdk-pixbuf2' 'libglvnd' 'libxrandr'
         'libxxf86vm' 'libxi' 'libxcursor' 'libxinerama')

source=("https://github.com/M1ndo/Neptune/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7593f7f3135c1ad0f576da40073557a2aa5a4ccdb6c5e5f3a1b939c896d5a0ec')

build() {
  export GOPATH="$srcdir"/gopath
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_ENABLED=1

  cd "$srcdir/Neptune-$pkgver"
  make linux
}

package() {
  cd "$srcdir/Neptune-$pkgver"
  make DESTDIR="$pkgdir" install
}
