# Maintainer: robertfoster
# Contributor: Tobias Luther <tobias [at] tonstrom [dot] de>
# Contributor: GraveDigger
# Contributor: Gaetan Bisson <bisson@archlinux.org>

pkgname=idjc
pkgver=0.9.10 # renovate: datasource=git-tags depName=https://git.code.sf.net/p/idjc/code
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
  'libebur128'
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
optdepends=('python-mysqlclient: Ampache and Prokyon 3 support'
  'python-irc: IRC notification support')
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

sha256sums=('aadd48058086baf2d95198926a60bf86b2f03fe1fdeb6b7a36cfdb0a5009ac4d')
