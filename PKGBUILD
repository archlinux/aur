# Maintainer: UshakovVasilii <UshakovVasilii@yahoo.com>
# Contributor: Charon77 <evans.jahja@yahoo.com>
# Contributor: debdj <debd92@gmail.com>

pkgname=florence
pkgver=0.6.3
pkgrel=1
pkgdesc="A configurable on-screen virtual keyboard"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/florence/"
license=('GPL')

# http://florence.sourceforge.net/english/install.html
depends=(
  'gtk3'
  'libxml2'
  'librsvg'
  'gettext'
  'gstreamer>=1.0'
  )

makedepends=('intltool>=0.23')

# libxtst > at-spi2-core > gtk3
#optdepends=(
#  'gnome-doc-utils'
#  'libnotify'
#  )

provides=(florence)
source=("http://sourceforge.net/projects/florence/files/florence/$pkgver/florence-$pkgver.tar.bz2")

md5sums=('8775051d7352f75dec5a86dc9964e8e0')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr \
  --without-docs \
  --without-notification

  make || return 1
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR=${pkgdir} install || return 1
}

