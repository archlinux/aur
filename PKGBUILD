# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

# FFmpeg compiled from Git repository with all possible libraries.
# At the current moment the following hardware related libraries
# are not included:
#    libstagefright-h264
#    mmal
#    libmfx

# AUR dependencies
# ----------------
# libilbc kvazaar libquvi-scripts0.4 libquvi0.4 chromaprint-fftw libaacplus libbs2b
# openh264 shine vo-aacenc vo-amrwbenc nut-multimedia-git xavs libutvideo-asm-git
# flite-fpic blackmagic-decklink-sdk nvidia-sdk

pkgname=ffmpeg-full-git
pkgver=N.77558.g15e1fd9
pkgrel=1
pkgdesc="Record, convert and stream audio and video (Git version with all possible libs)"
arch=('i686' 'x86_64')
url="http://www.ffmpeg.org/"
license=('GPL3' 'custom:UNREDISTRIBUTABLE')
depends=(
    'alsa-lib' 'zlib' 'bzip2' 'libpng' 'sdl' 'chromaprint-fftw' 'fontconfig' 'frei0r-plugins'
    'libgcrypt' 'gmp' 'gnutls' 'ladspa' 'libaacplus' 'libass' 'libbluray' 'libbs2b' 'libcaca'
    'celt' 'libcdio-paranoia' 'libdc1394' 'dcadec' 'faac' 'libfdk-aac' 'flite-fpic' 'freetype2'
    'fribidi' 'libgme' 'gsm' 'libiec61883' 'libilbc' 'kvazaar' 'libmodplug' 'lame'
    'nut-multimedia-git' 'opencore-amr' 'opencv' 'openh264' 'openjpeg' 'opus' 'pulseaudio'
    'rubberband' 'libquvi0.4' 'rtmpdump' 'schroedinger' 'shine' 'smbclient' 'libavc1394'
    'snappy' 'libsoxr' 'speex' 'libssh' 'tesseract' 'libtheora' 'twolame' 'libutvideo-asm-git'
    'v4l-utils' 'vid.stab' 'vo-aacenc' 'vo-amrwbenc' 'libvorbis' 'libvpx' 'wavpack' 'libwebp'
    'libx264.so' 'x265' 'libxcb' 'xvidcore' 'zimg' 'zeromq' 'zvbi' 'openal' 'libva'
    'opencl-headers' 'ocl-icd' 'libvdpau' 'mesa' 'openssl' 'xavs' 'nvidia-sdk'
    'blackmagic-decklink-sdk'
)
makedepends=('git' 'yasm')
provides=(
    'ffmpeg' 'qt-faststart' 'ffmpeg-git' 'ffmpeg-full' 'ffmpeg-full-extra' 'ffmpeg-full-nvenc'
    'ffmpeg-libfdk_aac' 'libavutil.so' 'libavcodec.so' 'libavformat.so' 'libavdevice.so'
    'libavfilter.so' 'libavresample.so' 'libswscale.so' 'libswresample.so' 'libpostproc.so'
)
conflicts=(
    'ffmpeg' 'ffmpeg-git' 'ffmpeg-full' 'ffmpeg-full-extra' 'ffmpeg-full-nvenc'
    'ffmpeg-libfdk_aac')
source=("$pkgname"::'git+http://source.ffmpeg.org/git/ffmpeg.git'
        'UNREDISTRIBUTABLE.txt')
sha256sums=('SKIP'
            'e0c1b126862072a71e18b9580a6b01afc76a54aa6e642d2c413ba0ac9d3010c4')

pkgver() {
	cd "${srcdir}/${pkgname}"

        # Git, tags available
        
	# Method showing version based on Arch Linux Wiki recommendations.
	#printf "%s" "$(git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g')"
	
	# Method showing version based on FFmpeg Git versioning. Preferred.
	printf "%s" "$(git describe --tags --match N | tr '-' '.')"

}

prepare() {
	cd "${srcdir}/${pkgname}"
	
        # Add the ALSA library to the Flite LDFLAGS variable and enables the discovery of Flite
        sed -i 's/-lflite"/-lflite -lasound"/' configure
        
}

build() {
	cd "${srcdir}/${pkgname}"
	
	msg "Running ffmpeg configure script. Please wait..."
	
        ./configure \
                --prefix=/usr \
                --extra-cflags="-I/usr/include/nvidia-sdk" \
                \
                --enable-rpath \
                --enable-gpl \
                --enable-version3 \
                --enable-nonfree \
                --enable-gray \
                --disable-static \
                --enable-shared \
                --disable-htmlpages \
                --disable-podpages \
                --disable-txtpages \
                --enable-avresample \
                --enable-videotoolbox \
                \
                --enable-avisynth \
                --enable-chromaprint \
                --enable-fontconfig \
                --enable-frei0r \
                --enable-gcrypt \
                --enable-gmp \
                --enable-gnutls \
                --enable-ladspa \
                --enable-libaacplus \
                --enable-libass \
                --enable-libbluray \
                --enable-libbs2b \
                --enable-libcaca \
                --enable-libcelt \
                --enable-libcdio \
                --enable-libdc1394 \
                --enable-libdcadec \
                --enable-libfaac \
                --enable-libfdk-aac \
                --enable-libflite \
                --enable-libfreetype \
                --enable-libfribidi \
                --enable-libgme \
                --enable-libgsm \
                --enable-libiec61883 \
                --enable-libilbc \
                --enable-libkvazaar \
                --enable-libmodplug \
                --enable-libmp3lame \
                --enable-libnut \
                --enable-libopencore-amrnb \
                --enable-libopencore-amrwb \
                --enable-libopencv \
                --enable-libopenh264 \
                --enable-libopenjpeg \
                --enable-libopus \
                --enable-libpulse \
                --enable-librubberband \
                --enable-libquvi \
                --enable-librtmp  \
                --enable-libschroedinger \
                --enable-libshine \
                --enable-libsmbclient \
                --enable-libsnappy \
                --enable-libsoxr \
                --enable-libspeex \
                --enable-libssh \
                --enable-libtesseract \
                --enable-libtheora \
                --enable-libtwolame \
                --enable-libutvideo \
                --enable-libv4l2 \
                --enable-libvidstab \
                --enable-libvo-aacenc \
                --enable-libvo-amrwbenc \
                --enable-libvorbis \
                --enable-libvpx \
                --enable-libwavpack \
                --enable-libwebp \
                --enable-libx264 \
                --enable-libx265 \
                --enable-libxavs \
                --enable-libxcb \
                --enable-libxcb-shm \
                --enable-libxcb-xfixes \
                --enable-libxcb-shape \
                --enable-libxvid \
                --enable-libzimg \
                --enable-libzmq \
                --enable-libzvbi \
                --enable-decklink \
                --enable-nvenc \
                --enable-openal \
                --enable-opencl \
                --enable-opengl \
                --enable-openssl \
                --enable-x11grab
	
	# Remove directory references in "--prefix" and "--extra-cflags" options from the 
	# configuration string that is presented in command line:
	sed -i 's,--prefix=/usr ,,g' config.h
	sed -i 's,--extra-cflags=-I/usr/include/nvidia-sdk ,,g' config.h
	
	make
	
	make tools/qt-faststart
}

package() {
	cd "${srcdir}/${pkgname}"
	
	make DESTDIR="$pkgdir/" install
	
	install -D -m755 tools/qt-faststart "${pkgdir}/usr/bin/qt-faststart"
	install -D -m644 "$srcdir"/UNREDISTRIBUTABLE.txt "${pkgdir}/usr/share/licenses/${pkgname}/UNREDISTRIBUTABLE.txt"
}
