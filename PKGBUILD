# Maintainer: Bruno Pagani (a.k.a. ArchangeGabriel) <bruno.n.pagani@gmail.com>

pkgbase=mpd
pkgname=mpd-minimal
pkgver=0.19.19
pkgrel=1
pkgdesc='Flexible, powerful, server-side application for playing music. Minimal version with only flac playback through socket connection as user, but configurable.'
url='http://www.musicpd.org/'
license=('GPL')
arch=('i686' 'x86_64' 'armv7h')
depends=('alsa-lib' 'flac' 'glib2' 'icu' 'libmpdclient' 'sqlite') # 'libsystemd'
makedepends=('boost')
provides=("mpd=$pkgver")
conflicts=('mpd')
replaces=('mpd')
validpgpkeys=('0392335A78083894A4301C43236E8A58C6DB4512')
source=("http://www.musicpd.org/download/mpd/${pkgver%.*}/mpd-${pkgver}.tar.xz"{,.sig})
sha1sums=('8c281b823825cab6677cb142b564acbf09a2874d' 'SKIP')

build() {
    cd "${srcdir}/mpd-${pkgver}"

	./configure \
        --prefix=/usr \
        --sysconfdir=/etc \
        --enable-libmpdclient \
        --disable-ao \
        --disable-httpd-output \
        --disable-jack \
        --disable-openal \
        --disable-oss \
        --disable-pulse \
        --disable-recorder-output \
        --disable-roar \
        --disable-shout \
        --disable-aac \
        --disable-adplug \
        --disable-audiofile \
        --disable-ffmpeg \
        --enable-flac \
        --disable-fluidsynth \
        --disable-gme \
        --disable-mad \
        --disable-mikmod \
        --disable-modplug \
        --disable-mpc \
        --disable-mpg123 \
        --disable-opus \
        --disable-sidplay \
        --disable-sndfile \
        --disable-vorbis \
        --disable-wavpack \
        --disable-wildmidi \
        --disable-curl \
        --disable-expat \
        --disable-ipv6 \
        --disable-libwrap \
        --disable-mms \
        --disable-nfs \
        --disable-smbclient \
        --disable-soundcloud \
        --disable-tcp \
        --disable-upnp \
        --disable-bzip2 \
        --disable-iso9660 \
        --disable-zlib \
        --disable-zzip \
        --disable-cdio-paranoia \
        --disable-id3 \
        --disable-largefile \
        --disable-lsr \
        --disable-soxr \
        --disable-lame-encoder \
        --disable-shine-encoder \
        --disable-twolame-encoder \
        --disable-vorbis-encoder \
        --disable-wave-encoder \
        --disable-neighbor-plugins \
        --enable-sqlite \
        --disable-systemd-daemon \
        --with-systemdsystemunitdir=/usr/lib/systemd/system \
        --with-zeroconf=no

    make
}

package_mpd-minimal() {
    cd "${srcdir}/mpd-${pkgver}"

    make DESTDIR="${pkgdir}" install
}
