# Maintainer: robertfoster
# Contributor: Tobias Luther <tobias [at] tonstrom [dot] de>

pkgname=idjc-git
pkgver=0.9.0.r8.332e11b
pkgrel=1
pkgdesc="Powerful client for individuals interested in streaming live radio shows"
arch=('i686' 'x86_64')
url="http://idjc.sourceforge.net/"
depends=(
  'desktop-file-utils'
  'ffmpeg'
  'flac'
  'glib2'
  'jack'
  'lame'
  'libmad'
  'libsamplerate'
  'libshout-idjc-git'
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
optdepends=('mysql-python: Ampache and Prokyon 3 support'
  'python-irc: IRC notification support')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('idjc::git+https://git.code.sf.net/p/idjc/code')

license=('GPL2')

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

md5sums=('SKIP')
