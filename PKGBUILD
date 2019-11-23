# Maintainer: robertfoster
# Contributor: Tobias Luther <tobias [at] tonstrom [dot] de>

pkgname=idjc-git
pkgver=931.9aa8e08
pkgrel=1
pkgdesc="Powerful client for individuals interested in streaming live radio shows"
arch=(i686 x86_64)
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
	 'pygtk'
	 'python2'
	 'python2-dbus'
	 'python2-mutagen'
	 'speex'
	 'twolame'
	 'vorbis-tools'
)
makedepends=('git')
optdepends=('mysql-python: Ampache and Prokyon 3 support')
conflicts=('idjc')
source=('idjc::git+https://git.code.sf.net/p/idjc/code')

license=('GPL3')

build() {
  cd idjc
  ./bootstrap
  export PYTHON=/usr/bin/python2
    ./configure \
        --prefix=/usr \
        --libexecdir=/usr/lib \
        --disable-static
  make
}

package() {               
  cd idjc
  make DESTDIR=$pkgdir install
  sed -i "s/Icon=\/usr\/share\/pixmaps\/${pkgname%%-git}.png/Icon=${pkgname%%-git}/g" $pkgdir/usr/share/applications/${pkgname%%-git}.desktop
}

pkgver() {
  cd idjc
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

md5sums=('SKIP')

