# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

# AUR dependencies: esound gnome-vfs-nosmb sndio

# NOTE:
# '--with-imagemagick' works only with ImageMagick 6 and will not work with IM7
# (and IM git version). If you have IM7 installed, please change it to
# '--without-magick'.

pkgname=xine-lib-hg
pkgver=1.2.7.r12910.d24c69278026
pkgrel=1
pkgdesc="A multimedia playback engine (Mercurial version with all possible libs)"
arch=('i686' 'x86_64')
url="https://www.xine-project.org/"
license=('GPL2' 'LGPL2.1')
depends=('fontconfig')
makedepends=('mercurial' 'a52dec' 'aalib' 'directfb' 'esound' 'faad2' 'ffmpeg'
             'gdk-pixbuf2' 'glu' 'gnome-vfs-nosmb' 'imagemagick<7.0.0.0' 'jack'
             'libcaca' 'libcdio' 'libbluray' 'libdca' 'libdvdnav' 'libmad'
             'libmng' 'libmpcdec' 'libpulse' 'libvdpau' 'libxinerama' 'libxvmc'
             'smbclient' 'v4l-utils' 'vcdimager' 'wavpack'
)
optdepends=('a52dec: for using the a52 plugin'
            'aalib: for using the aalib plugin'
            'alsa-lib: for using the alsa plugin'
            'esound: for using the esound plugin'
            'faad2: for using the faad plugin'
            'ffmpeg: for using the ff/avformat/avutil plugin'
            'flac: for using the flac plugin'
            'gdk-pixbuf2: for using the gdk-pixbuf plugin'
            'glu: for using the opengl plugin'
            'gnome-vfs-nosmb: for using the gnome-vfs plugin'
            'imagemagick: for using the imagemagick plugin'
            'jack: for using the jack plugin'
            'libbluray: for using the bluray plugin'
            'libcaca: for using the caca plugin'
            'libcdio: for using the cd plugin'
            'libdca: for using the dts plugin'
            'libdvdnav: for using the dvd plugin'
            'libjpeg-turbo: for using the libjpeg plugin'
            'libmad: for using the mp3 plugin'
            'libmng: for using the mng plugin'
            'libmodplug: for using the modplug plugin'
            'libmpcdec: for using the musepack plugin'
            'libpulse: for using the pulseaudio plugin'
            'libtheora: for using the xiph plugin'
            'libva: for using the vaapi plugin'
            'libvdpau: for using the vdpau plugin'
            'libvorbis: for using the xiph plugin'
            'libvpx: for using the libvpx plugin'
            'libxcb: for using the xcb-shm and xcb-xv plugins'
            'libxinerama: for using the xv plugin'
            'sdl: for using the sdl plugin'
            'smbclient: for using the samba plugin'
            'sndio: for using the sndio plugin'
            'speex: for using the xiph plugin'
            'v4l-utils: for using the v4l2 plugin'
            'vcdimager: for using the vcd plugin'
            'wavpack: for using the wavpack plugin'
)
provides=('xine-lib')
conflicts=('xine-lib')
source=("$pkgname"::'hg+http://hg.debian.org/hg/xine-lib/xine-lib-1.2-vdpau')
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"
	
	# Mercurial        
	printf "%s.r%s.%s" "$(hg log -r "." --template "{latesttag}")" \
	                   "$(hg identify -n)" \
	                   "$(hg identify -i)"
}

build() {
	cd "${srcdir}/${pkgname}"
	
	./autogen.sh
	
	./configure \
	        --prefix=/usr \
	        \
	        --enable-ipv6 \
	        --enable-antialiasing \
	        --enable-static=no \
	        --enable-shared=yes \
	        --enable-fast-install=yes \
	        --enable-optimizations \
	        --enable-largefile \
	        --enable-libxine-builtins \
	        \
	        --disable-coreaudio \
	        --disable-irixal \
	        --enable-oss \
	        --disable-sunaudio \
	        --enable-sndio \
	        --enable-aalib \
	        --disable-dha-kmod \
	        --enable-directfb \
	        --enable-dxr3 \
	        --enable-fb \
	        --disable-macosx-video \
	        --enable-opengl \
	        --enable-glu \
	        --disable-vidix \
	        --enable-xinerama \
	        --disable-static-xv \
	        --enable-xvmc \
	        --enable-vdpau \
	        --enable-vaapi \
	        --enable-dvb \
	        --enable-gnomevfs \
	        --enable-samba \
	        --enable-v4l2 \
	        --enable-libv4l \
	        --enable-vcd \
	        --enable-vdr \
	        --enable-bluray \
	        --enable-avformat \
	        --enable-a52dec \
	        --enable-asf \
	        --enable-nosefart \
	        --enable-faad \
	        --enable-ffmpeg \
	        --enable-postproc \
	        --enable-gdkpixbuf \
	        --enable-libjpeg \
	        --enable-dts \
	        --enable-mad \
	        --enable-modplug \
	        --disable-libmpeg2new \
	        --enable-musepack \
	        --disable-mlib \
	        --disable-mlib-lazyload \
	        --enable-mng \
	        --enable-real-codecs \
	        --disable-w32dll \
	        --enable-vpx \
	        --disable-mmal \
	        \
	        --with-freetype \
	        --with-fontconfig \
	        --with-x \
	        --with-alsa \
	        --with-esound \
	        --without-fusionsound \
	        --with-jack \
	        --with-pulseaudio \
	        --with-caca \
	        --without-linux-path \
	        --without-libstk \
	        --with-sdl \
	        --with-xcb \
	        --with-external-dvdnav \
	        --with-imagemagick \
	        --with-libflac \
	        --with-speex \
	        --with-theora \
	        --with-vorbis \
	        --with-wavpack 
	        
	        # TODO:
	        # --enable-dha-kmod
	        # --enable-vidix
	        # --with-fusionsound
	        # --with-linux-path=/usr/lib/modules/$(uname -r)/build
	        # --with-libstk
	        # --with-openhevc
	
	make
}

package() {
	cd "${srcdir}/${pkgname}"
	
	make DESTDIR="$pkgdir/" install
}
