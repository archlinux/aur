# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=cheese
pkgver=2.91.91
pkgrel=1
pkgdesc="Use your webcam to take photos and videos, apply fancy special effects and share the fun with others"
arch=(i686 x86_64)
license=('GPL')
depends=('gnome-desktop' 'gtk3' 'libcanberra' 'librsvg' 'gstreamer0.10-base-plugins' 'gstreamer0.10-good-plugins' 'clutter-gst' 'clutter-gtk' 'libgee' 'gnome-video-effects' 'hicolor-icon-theme')
makedepends=('pkgconfig' 'gnome-doc-utils>=0.20.1' 'intltool' 'gtk-doc' 'gnome-common')
groups=('gnome-extra')
options=('!libtool' '!emptydirs')
url="http://www.gnome.org/projects/cheese/"
install=cheese.install
source=(http://ftp.gnome.org/pub/gnome/sources/${pkgname}/2.91/${pkgname}-${pkgver}.tar.bz2
        wrong_requirements.patch)
sha256sums=('8f34469cb9cd09d9edb163a0f014c8ed9764645698e3c07f75534c20bc7c70df'
            '58ecf6764585619d9708bf4bd3cb47f3a1caab3fbd7437905aba0407ac65b877')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -Np1 -i "${srcdir}/wrong_requirements.patch"
  gnome-autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --libexecdir=/usr/lib \
      --disable-scrollkeeper --disable-static
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
