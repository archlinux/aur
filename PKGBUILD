# Maintainer: robertfoster

pkgname=liquidsoap
pkgver=1.3.4
pkgrel=1
pkgdesc="A swiss-army knife for multimedia streaming, notably used for netradios and webtvs"
arch=('i686' 'x86_64')
url="http://savonet.sourceforge.net/"
license=('GPL')
depends=('dssi' 'faad2' 'ffmpeg' 'fluidsynth' 'gavl' 'gd' 'giflib' 'gst-plugins-bad' 'gst-plugins-base' 'gst-plugins-good' 'gst-plugins-ugly' 'libao' 'libfdk-aac'
    'liblo' 'libmad' 'libxpm' 'ocaml-camomile' 'openssl' 'sdl_image' 'sdl_ttf' 'soundtouch' 'taglib' 'ocaml-magic' 'ocaml-inotify'
    'ocaml-cry'
    'ocaml-ao'
    'ocaml-pulseaudio'
    'ocaml-bjack'
    'ocaml-gstreamer'
    'ocaml-mad'
    'ocaml-taglib'
    'ocaml-lame'
    'ocaml-ogg'
    'ocaml-vorbis'
    'ocaml-speex'
    'ocaml-theora'
    'ocaml-opus'
    'ocaml-fdkaac'
    'ocaml-faad'
    'ocaml-flac'
    'ocaml-ladspa'
    'ocaml-soundtouch'
    'ocaml-samplerate'
    'ocaml-gavl'
    'ocaml-ffmpeg'
    #'ocaml-frei0r'
    'ocaml-dssi'
    'ocaml-xmlplaylist'
    'ocaml-lastfm'
    'ocaml-lo'
    'ocaml-dtools'
    'ocaml-duppy'
'ocaml-mm')

makedepends=('camlp4' 'git' 'ladspa' 'libxml-perl' 'ocaml-findlib' 'ocaml-gd4o' 'ocaml-ocamlsdl' 'ocaml-pcre' 'ocaml-ssl' 'ocaml-xmlm' 'ocaml-yojson' 'perl-xml-dom')
optdepends=('curl')
source=("https://github.com/savonet/liquidsoap/releases/download/$pkgver/$pkgname-$pkgver.tar.bz2"
    $pkgname.service
    $pkgname.tmpfilesd
)

install=$pkgname.install
options=(!makeflags)
conflicts=('liquidsoap-git' 'liquidsoap-full')

build() {
    cd $srcdir/$pkgname-$pkgver

    ./configure --prefix=/usr  --localstatedir=/var --sysconfdir=/etc --without-user --without-group --disable-oss
    make all && make doc
}

package() {
    cd $srcdir/$pkgname-$pkgver
    make DESTDIR="$pkgdir/" datadir="$pkgdir/usr/share/" mandir="$pkgdir/usr/share/man/"  localstatedir="$pkgdir/var"  bindir="$pkgdir/usr/bin/"  libdir="$pkgdir/usr/lib/" sysconfdir="$pkgdir/etc/" install

    # Install systemd unit
    install -Dm0644 "$srcdir/$pkgname.service" "$pkgdir/usr/lib/systemd/system/liquidsoap@.service"
    # Install the tmpfilesd file
    install -Dm0644 $srcdir/$pkgname.tmpfilesd $pkgdir/usr/lib/tmpfiles.d/liquidsoap.conf
}

md5sums=('74ecab05dc1b872ae21206e4e29dc460'
    '762d6607ff0889e34b8c874970b38bc9'
'f9106e5c42cabc21c4c8464d9b1ad63e')
