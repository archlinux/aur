# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix

pkgname=playmymusic-git
pkgver=1.0.3.r0.g385f97a
pkgrel=1
pkgdesc="Melody is a music player for Pantheon, developed by Artem Anufrij"
arch=('x86_64')
url="http://anufrij.org/melody/"
license=('GPL3')
depends=('libgranite.so' 'libsoup' 'gst-plugins-base-libs' 'taglib' 'gtk3')
makedepends=('meson' 'vala' 'git')
optdepends=('gst-plugins-base: "Base" plugin libraries'
            'gst-plugins-good: "Good" plugin libraries'
            'gst-plugins-bad: "Bad" plugin libraries'
            'gst-plugins-ugly: "Ugly" plugin libraries')
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
}
