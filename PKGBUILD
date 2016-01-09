# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

# AUR dependencies: esound

pkgname=xine-lib-hg
pkgver=r12705.1f688d8f0cb3
pkgrel=1
pkgdesc="A multimedia playback engine (Mercurial version with all possible libs)"
arch=('i686' 'x86_64')
url="https://www.xine-project.org/"
license=('GPL2' 'LGPL')
depends=(
    'aalib' 'directfb' 'mesa' 'glu' 'libxinerama' 'libxvmc' 'libvdpau' 'libva'
    'linuxtv-dvb-apps' 'gnome-vfs' 'smbclient' 'v4l-utils' 'vcdimager' 'libbluray'
    'ffmpeg' 'a52dec' 'faad2' 'gdk-pixbuf2' 'libjpeg-turbo' 'libdca' 'libmad'
    'libmodplug' 'libmpeg2' 'libmpcdec' 'libmng' 'libvpx' 'freetype2' 'fontconfig'
    'xorg-server-devel' 'alsa-lib' 'esound' 'jack' 'pulseaudio' 'libcaca' 'sdl'
    'libxcb' 'xcb-util-image' 'imagemagick' 'flac' 'speex' 'libtheora' 'libvorbis'
    'wavpack' 'libxv'
)
makedepends=('mercurial')
provides=('xine-lib')
conflicts=('xine-lib')
source=("$pkgname"::'hg+http://hg.debian.org/hg/xine-lib/xine-lib-1.2-vdpau')
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"

        # Mercurial        
	
	printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"

}

prepare() {
	cd "${srcdir}/${pkgname}"
	
	./autogen.sh
}

build() {
	cd "${srcdir}/${pkgname}"
	
        ./configure \
                --prefix=/usr \
                \
                --enable-static=no \
                --enable-shared=yes \
                --enable-fast-install=yes \
                \
                --enable-oss \
                --enable-aalib \
                --disable-dha-kmod \
                --enable-directfb \
                --enable-dxr3 \
                --enable-fb \
                --enable-opengl \
                --enable-glu \
                --disable-vidix \
                --enable-xinerama \
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
                --enable-gdkpixbuf \
                --enable-libjpeg \
                --enable-dts \
                --enable-mad \
                --enable-modplug \
                --enable-libmpeg2new \
                --enable-musepack \
                --enable-mng \
                --enable-vpx \
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
	
	make
}

package() {
	cd "${srcdir}/${pkgname}"
	
	make DESTDIR="$pkgdir/" install
}
