# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=uget-git
pkgver=r628.g0c5b01f
pkgrel=1
pkgdesc="Lightweight yet powerful download manager"
arch=('i686' 'x86_64')
url="https://ugetdm.com"
license=('LGPL')
depends=('glibc' 'curl' 'gstreamer' 'gtk3' 'libnotify')
makedepends=('git' 'bash' 'intltool')
optdepends=('aria2: alternative backend')
provides=("uget=$pkgver")
conflicts=('uget')
source=("git+https://git.code.sf.net/p/urlget/uget2"
        "uget-gtk.appdata.xml::https://raw.githubusercontent.com/archlinux/svntogit-community/packages/uget/trunk/uget-gtk.appdata.xml")
sha256sums=('SKIP'
            'SKIP')


pkgver() {
  cd "uget2"

  _rev=$(git rev-list --count --all)
  _hash=$(git rev-parse --short HEAD)
  printf "r%s.g%s" "$_rev" "$_hash"
}

build() {
  cd "uget2"

  sh autogen.sh
  bash configure \
    --prefix="/usr"
  make
}

check() {
  cd "uget2"

  make check
}

package() {
  cd "uget2"

  make DESTDIR="$pkgdir" install
  install -Dm644 "$srcdir/uget-gtk.appdata.xml" -t "$pkgdir/usr/share/metainfo"
}
