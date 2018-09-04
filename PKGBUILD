# Maintainer: Kyle MacLeod <aur.kmac5@recursor..net>
# Modified from corebird-git

pkgname=corebird-non-streaming-git
pkgver=1.1.r1710.ge843911e
pkgrel=1
pkgdesc="Fork of corebird twitter client, modified to work within new twitter API limitations"
arch=('i686' 'x86_64')
license=('GPL')
url="https://corebird.baedert.org/"
depends=('gtk3'
         'rest'
         'libgee'
         'sqlite3'
         'gst-plugins-good'
         'gst-plugins-bad'
         'gst-libav'
         'gspell')
optdepends=('noto-fonts-emoji: Emoji support')
makedepends=('vala' 'git' 'meson' 'intltool')
provides=('corebird')
conflicts=('corebird' 'corebird-git')
source=("${pkgname}::git+https://github.com/IBBoard/corebird.git#branch=non-streaming")
sha1sums=('SKIP')

pkgver() {
  cd ${pkgname}
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd ${pkgname}

  meson builddir --prefix=/usr -D VIDEO=yes -D SPELLCHECK=yes
  ninja -C builddir
}

package() {
  cd ${pkgname}

  DESTDIR="${pkgdir}" ninja -C builddir install
}
