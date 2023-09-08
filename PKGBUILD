# Maintainer: robertfoster
# Contributor: Tobias Luther <tobias [at] tonstrom [dot] de>

pkgname=idjc-git
pkgver=0.9.5.r28.bb8bfa9
pkgrel=1
pkgdesc="Powerful client for individuals interested in streaming live radio shows"
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
makedepends=('git')
optdepends=('python-mysqlclient: Ampache and Prokyon 3 support'
  'python-irc: IRC notification support')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('idjc::git+https://git.code.sf.net/p/idjc/code')

build() {
  cd "${srcdir}/${pkgname%-git}"

  ./bootstrap
  ./configure \
    --prefix=/usr \
    --libexecdir=/usr/lib \
    --disable-static
  make
}

package() {
  cd "${srcdir}/${pkgname%-git}"

  make DESTDIR=${pkgdir} install

  sed -i "s/Icon=\/usr\/share\/pixmaps\/${pkgname%%-git}.png/Icon=${pkgname%%-git}/g" \
    ${pkgdir}/usr/share/applications/${pkgname%%-git}.desktop
}

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

sha256sums=('SKIP')
