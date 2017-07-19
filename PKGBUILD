# Maintainer:
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Maxime Gauduin <alucryd@gmail.com>
# Contributor: Dave Reisner <dreisner@archlinux.org>
# Contributor: Alexander Fehr <pizzapunk gmail com>

pkgname=rubyripper
pkgver=0.6.2
pkgrel=10
pkgdesc='Secure audiodisc ripper'
arch=('any')
url='http://code.google.com/p/rubyripper/'
license=('GPL3')
depends=('cdparanoia' 'gtk2' 'ruby-iconv')
optdepends=('ruby-gtk2: GTK+ GUI'
            'cd-discid: Freedb support'
            'lame: MP3 encoding support'
            'vorbis-tools: Ogg Vorbis encoding support'
            'flac: FLAC encoding support'
            'wavegain: WAV ReplayGain support'
            'mp3gain: MP3 ReplayGain support'
            'vorbisgain: Ogg Vorbis ReplayGain support'
            'normalize: Normalization support'
            'cdrdao: Advanced TOC analysis')
source=("https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/rubyripper/rubyripper-$pkgver.tar.bz2")
sha256sums=('817a800ba9a8eca9a8130fad861913c8ebdc4ec3011135e216b41007fc989ebb')

build() {
  cd "${pkgname}-${pkgver}"

  ./configure --prefix='/usr' --enable-{cli,gtk2} \
    --ruby="$(ruby -e 'v = RbConfig::CONFIG["vendorlibdir"] ; v["/usr"] = ""; puts v')"
}

package() {
  make DESTDIR="$pkgdir" -C "$pkgname-$pkgver" install
}

# vim: ts=2 sw=2 et:
