# Maintainer: Rodrigo Arias Mallo <rodarima@gmail.com>

pkgname=dillo-git
pkgver=v3.0.5.r4630.g1711ba8
pkgrel=1
pkgdesc="A small, fast graphical web browser built on FLTK"
arch=(x86_64)
url="https://github.com/dillo-browser/dillo"
license=('GPL')
depends=('fltk' 'libjpeg' 'perl' 'openssl' 'libpng' 'gcc-libs' 'libxcursor'
         'libxi' 'libxinerama')
conflicts=('dillo')
backup=(etc/dillo/{dillorc,dpidrc})
source=(git+https://github.com/dillo-browser/dillo.git
        dillo.desktop
        ProgramIcon48.png)
sha256sums=('SKIP'
            '54848080de1911a2af8ff786fbe92bdad8fe8b7b8a0d580c9c79b0a98f9fdcde'
            'de629745e6f3a271475a501e2b94558b3deb7bf9a407bcef16426e600e1731f3')

build() {
  cd "$srcdir/dillo"
  ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

pkgver() {
  cd "$srcdir/dillo"
  git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/dillo"
  make DESTDIR="$pkgdir" install

  install -Dm644 ../dillo.desktop "$pkgdir/usr/share/applications/dillo.desktop"
  install -Dm644 ../ProgramIcon48.png "$pkgdir/usr/share/pixmaps/dillo.png"
}
