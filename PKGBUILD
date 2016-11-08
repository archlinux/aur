# Maintainer: M0Rf30
# Contributor: Tobias Luther <tobias [at] tonstrom [dot] de>

pkgname=idjc-git
pkgver=882.7e4ff89
pkgrel=1
pkgdesc="Powerful client for individuals interested in streaming live radio shows"
arch=(i686 x86_64)
url="http://idjc.sourceforge.net/"
depends=('dbus-python'
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
	 'mutagen'
	 'pygtk'
	 'python2'
	 'speex'
	 'twolame'
	 'vorbis-tools'
)
makedepends=('git')
optdepends=('mysql-python: Ampache and Prokyon 3 support')
conflicts=('idjc')
source=('idjc::git://idjc.git.sourceforge.net/gitroot/idjc/idjc')

license=('GPL3')

build()
{
  cd idjc
  ./bootstrap
  export PYTHON=/usr/bin/python2
    ./configure \
        --prefix=/usr \
        --libexecdir=/usr/lib \
        --disable-static
  make
}

package()
{               
  cd idjc
  make DESTDIR=$pkgdir install
}

pkgver() {
  cd idjc
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

md5sums=('SKIP')

