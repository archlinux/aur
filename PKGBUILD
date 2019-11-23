# Maintainer: robertfoster
# Contributor: Tobias Luther <tobias [at] tonstrom [dot] de>
# Contributor: GraveDigger
# Contributor: Gaetan Bisson <bisson@archlinux.org>

pkgname=idjc
pkgver=0.8.17
pkgrel=4
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
    'pygtk'
    'python2'
    'python2-dbus'
    'python2-mutagen'
    'speex'
    'twolame'
    'vorbis-tools'
)

optdepends=('mysql-python: Ampache and Prokyon 3 support'
'python2-irc3: IRC notification support')
conflicts=('idjc-git')
install=${pkgname}.install
source=("http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz")

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    
    export PYTHON=/usr/bin/python2
    ./configure \
    --prefix=/usr \
    --libexecdir=/usr/lib \
    --disable-static
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
    sed -i "s/Icon=\/usr\/share\/pixmaps\/$pkgname.png/Icon=$pkgname/g" $pkgdir/usr/share/applications/$pkgname.desktop
}

md5sums=('47f13035d94f5c378bf237c335194a4d')
