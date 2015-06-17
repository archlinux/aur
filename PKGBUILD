# Maintainer: M0Rf30
# Contributor: Tobias Luther <tobias [at] tonstrom [dot] de>

pkgname=idjc-git
pkgver=796.179dfef
pkgrel=1
pkgdesc="A graphical shoutcast and icecast client."
arch=(i686 x86_64)
url="http://idjc.sourceforge.net/"
depends=('python2' 'jack' 'pygtk' 'lame' 'mutagen' 'flac' 'faad2' 'libsamplerate' 'vorbis-tools' 'libsndfile' 'ffmpeg-compat' 'libmad' 'speex' 'dbus-python' 'imagemagick' 'twolame' 'libshout-idjc-git' 'mpg123' 'twolame')
makedepends=('git')
optdepends=('mysql-python: Ampache and Prokyon 3 support')
conflicts=('idjc')
source=('idjc::git://idjc.git.sourceforge.net/gitroot/idjc/idjc')

license=('GPL3')

build()
{
  cd idjc
  ./bootstrap
  PKG_CONFIG_PATH+="/usr/lib/ffmpeg-compat/pkgconfig" 
  ./configure --prefix=/usr CFLAGS="-O2" PYTHON="/usr/bin/python2"
  make
}

package()
{               
  cd idjc
  make DESTDIR=$pkgdir install
  cd $pkgdir/usr/bin
  sed -i -e 's/python22.7/python2/' idjc
}

pkgver() {
  cd idjc
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

md5sums=('SKIP')

