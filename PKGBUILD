# Maintainer:
# Contributor: Robert Emil Berge <robert@rebi.no>

pkgname=kino
pkgver=1.3.4
pkgrel=6
pkgdesc="A non-linear DV editor"
arch=('i686' 'x86_64')
url="http://www.kinodv.org/"
license=('GPL')
depends=('libavc1394' 'libiec61883' 'libdv' 'libglade' 'libxv' 'libsamplerate' 'libsm' 'desktop-file-utils')
makedepends=('intltool' 'v4l-utils')
source=("http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        'videodev-header.patch')
md5sums=('52f8ce690e45a089e3edc6c7af61a05c'
         '940404c0eec3c9d954c289ceb52d15a6')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  patch -p1 -i "${srcdir}"/videodev-header.patch

  ./configure --prefix=/usr \
              --with-udev-rules-dir=/usr/lib/udev/rules.d
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  # Fix permissions
  chown -R root:root "${pkgdir}/usr/share/kino/help"
}
