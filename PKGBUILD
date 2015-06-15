# Contributor: zhuqin <zhuqin@gmail.com>
# Maintainer: Lucas Salies Brum <lucas@archlinux.com.br>

pkgname=google-gadgets-gtk-svn
pkgver=1292
pkgrel=2
pkgdesc="Google Gadgets for linux (svn version, gtk toolkit)"
url="http://code.google.com/p/google-gadgets-for-linux/"
license="Apache"
depends=('curl' 'libxml2' 'zlib' 'xulrunner' 'dbus' 'cairo' 'gtk2')
makedepends=('subversion' 'autoconf' 'automake' 'libtool' 'flex')
provides=(google-gadgets)
source=(svn+http://google-gadgets-for-linux.googlecode.com/svn/trunk/)
sha512sums=('SKIP')
arch=('i686' 'x86_64')
options=('!libtool')
install=ggl.install

pkgver() {
  cd trunk
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

build() {
        cd trunk
               
        sh autotools/bootstrap.sh
        ./configure --prefix=/usr \
                    --disable-libggadget-qt \
                    --disable-qt-system-framework \
                    --disable-qtwebkit-browser-element \
                    --disable-qt-host \
                    --disable-ltdl-install \
                    --disable-static \
                    --disable-update-mime-database \
                    --disable-update-desktop-database \
                    --enable-smjs-script-runtime \
                    --enable-gtk-host \
                    --enable-libggadget-gtk \
                    --enable-gst-audio-framework \
                    --enable-gst-mediaplayer-element \
                    --enable-libggadget-dbus \
                    --enable-gtkmoz-browser-element \
                    --enable-gtk-system-framework \
                    --enable-curl-xml-http-request \
                    --enable-libxml2-xml-parser
                    
        make
}

package(){
	cd trunk
        make DESTDIR=$pkgdir install
}
