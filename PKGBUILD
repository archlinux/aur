# Maintainer: goetzc
pkgname=subtitleeditor-git
pkgver=0.54.0.r12.g3a66a9a
pkgrel=1
pkgdesc="GTK+3 tool to create and edit subtitles."
arch=('i686' 'x86_64')
url="http://kitone.github.io/subtitleeditor/"
license=('GPL3')
depends=('enchant' 'gst-plugins-base' 'gst-libav'
         'gstreamermm>=1.0' 'gtkmm3' 'libxml++2.6')
makedepends=('intltool')
optdepends=('gst-plugins-ugly: to be able to view movies inside the subtitleeditor')
provides=(${pkgname%-*})
conflicts=(${pkgname%-*})
source=('subtitleeditor-git::git+https://github.com/kitone/subtitleeditor.git')
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd ${pkgname}

  sh autogen.sh --prefix=/usr
  make
}

package() {
  cd ${pkgname}

  make DESTDIR=${pkgdir} install
}

