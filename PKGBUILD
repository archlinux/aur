# Contributor: joyfulgirl@archlinux.us
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=dillo-hg
pkgver=r4664.67b70f024568
pkgrel=1
pkgdesc="A small, fast, FLTK-based web browser"
arch=('i686' 'x86_64')
url="http://www.dillo.org/"
license=('GPL3')
depends=('fltk' 'libxi' 'libxinerama' 'openssl' 'perl')
makedepends=('mercurial')
optdepends=('ttf-dejavu: Enable DejaVu Sans support')
provides=('dillo')
conflicts=('dillo')
backup=('etc/dillo/dillorc' 'etc/dillo/dpidrc')
source=("hg+https://hg.dillo.org/dillo" dillo.png dillo.desktop)
sha256sums=('SKIP'
            'de629745e6f3a271475a501e2b94558b3deb7bf9a407bcef16426e600e1731f3'
            'e94ead3a359c2eceb934b07af0fac4864251b9721fa7f4855331daa017b66202')

pkgver() {
  cd dillo
  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

build() {
  cd dillo
  CFLAGS+=' -fcommon'
  ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc/ --enable-ssl --enable-cookies
  make
}

package() {
  cd dillo
  make DESTDIR="$pkgdir" install
}
