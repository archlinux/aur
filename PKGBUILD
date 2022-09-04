# Maintainer: robertfoster
# Contributor: Tobias Luther <tobias [at] tonstrom [dot] de>
# Contributor: GraveDigger
# Contributor: Gaetan Bisson <bisson@archlinux.org>

pkgname=idjc
pkgver=0.9.4
pkgrel=1
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
source=("http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz")

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

sha256sums=('0ac9a27f911f348851d6cbd207d8415ed7c2eee9d50675c51ee7c83b49cdee6f')
