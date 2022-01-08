# Maintainer: robertfoster
# Contributor: Tobias Luther <tobias [at] tonstrom [dot] de>
# Contributor: GraveDigger
# Contributor: Gaetan Bisson <bisson@archlinux.org>

pkgname=idjc
pkgver=0.9.2
pkgrel=2
pkgdesc='Powerful client for individuals interested in streaming live radio shows'
url='http://idjc.sourceforge.net/'
license=('GPL2')
arch=('i686' 'x86_64')
depends=(
  'desktop-file-utils'
  'ffmpeg'
  'flac'
  'glib2'
  'jack'
  'lame'
  'libmad'
  'libsamplerate'
  'libshout-idjc'
  'libsndfile'
  'python'
  'python-dbus'
  'python-gobject'
  'python-mutagen'
  'speex'
  'twolame'
  'vorbis-tools'
)
optdepends=('mysql-python: Ampache and Prokyon 3 support'
'python-irc: IRC notification support')
conflicts=('idjc-git')
source=("http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz"
  "python3.10.patch"
)

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -Np1 -i ../python3.10.patch
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  
  ./configure \
  --prefix=/usr \
  --libexecdir=/usr/lib \
  --disable-static
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  
  make DESTDIR="${pkgdir}" install
  
  sed -i "s/Icon=\/usr\/share\/pixmaps\/${pkgname}.png/Icon=${pkgname}/g" \
  "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}

sha256sums=('4762cda6eb6428a06ba3837d0cb40f47218c344293e4997b91f4ec0479933c03'
            '94384a7b30b71c165ee8b0c49c8f0aa1f2b28cfd2685a6db5fad5751d621572c')
