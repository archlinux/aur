# Maintainer: Spike29 <leguen.yannick@gmail.com>
# Contributor: goetzc <goetzchrist@gmail.com>
# Contributor: Lucas Saliés Brum <lucas@archlinux.com.br>
 
pkgname=audio-recorder
pkgver=3.3.4
pkgrel=3
_ubuntucodename=jammy
pkgdesc="Audio Recorder Application"
arch=('x86_64')
url='https://launchpad.net/~audio-recorder'
license=('GPL-3.0-or-later')
depends=('cairo' 'dconf' 'gdk-pixbuf2' 'glibc' 'glib2' 'gst-plugins-base' 'gst-plugins-good' 'gstreamer' 'gtk3' 'hicolor-icon-theme' 'libappindicator-gtk3')
makedepends=('intltool')
optdepends=('pulseaudio: support for the pulsesrc plugin'
            'pipewire: support for the pipewiresrc plugin'
            'gst-plugins-bad: support for AAC encoding'
            'gst-plugins-ugly: support for MP3 encoding'
            'gst-libav: plugin for the libav library')
source=("https://launchpad.net/~${pkgname}/+archive/ubuntu/ppa/+sourcefiles/${pkgname}/${pkgver}~${_ubuntucodename}/${pkgname}_${pkgver}~${_ubuntucodename}.tar.gz")
md5sums=('d7ca6db99f948af922773d1fee68dc1f')

build() {
  cd "${srcdir}/trunk"

  # Workaround to compile with gcc >= 15
  export CFLAGS+=" -std=gnu17"

  ./configure --prefix=/usr
  make
}
 
package() {
  cd "${srcdir}/trunk"
  make DESTDIR="${pkgdir}/" install
}
