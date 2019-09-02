# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix

pkgname=playmymusic-git
pkgver=2.2.1.r9.g22175ba
pkgrel=2
pkgdesc="Melody is a music player for Pantheon, developed by Artem Anufrij"
arch=(x86_64)
url="http://anufrij.org/melody/"
license=(GPL3)
depends=(libgranite.so libsoup gst-plugins-base gst-plugins-good taglib gtk3)
makedepends=(meson vala git)
optdepends=('gst-plugins-bad: "Bad" plugin libraries'
            'gst-plugins-ugly: "Ugly" plugin libraries')
provides=(playmymusic)
conflicts=(playmymusic)
source=("${pkgname}::git+https://github.com/artemanufrij/playmymusic.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${pkgname}"
  meson build --prefix=/usr
  ninja -C build
}

package() {
  cd "${srcdir}/${pkgname}"
  DESTDIR="${pkgdir}" ninja -C build install
  ln -s /usr/bin/com.github.artemanufrij.playmymusic "$pkgdir/usr/bin/playmymusic"
}
