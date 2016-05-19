pkgname=subtitleeditor-svn
pkgver=0.52.1.r952 
pkgrel=1
pkgdesc="GTK+3 tool to create and edit subtitles."
arch=('i686' 'x86_64')
url="http://home.gna.org/subtitleeditor/"
license=('GPL3')
depends=('desktop-file-utils' 'enchant' 'gst-plugins-base' 'gst-libav' 'gstreamermm>=1.0' 
         'gtk3' 'gtkmm3' 'hicolor-icon-theme' 'libsigc++' 'libxml++' 'xdg-utils')
#makedepends=('svn' 'intltool' 'mm-common')
optdepends=('gst-plugins-ugly: to be able to view movies inside the subtitleeditor')
provides=(${pkgname%-*})
conflicts=(${pkgname%-*})
source=('subtitleeditor-svn::svn+http://svn.gna.org/svn/subtitleeditor/trunk')
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  local ver="$(svnversion)"
  printf "0.52.1.r%s" "${ver//[[:alpha:]]}"
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
