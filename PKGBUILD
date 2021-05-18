# Maintainer:  Eivind Eide <xenofil AT gmail DOT com>
# Contributor: Alexander F Rødseth <xyproto AT archlinux DOT org>
# Contributor: Maxime Gauduin <alucryd AT gmail DOT com>
# Contributor: Dave Reisner <dreisner AT archlinux DOT org>
# Contributor: Alexander Fehr <pizzapunk AT gmail DOT com>

pkgname=rubyripper
pkgver=0.8.0rc2
pkgrel=2
pkgdesc='Secure audiodisc ripper'
arch=('any')
url='http://code.google.com/p/rubyripper/'
license=('GPL3')
depends=('cdparanoia' 'gtk3' 'ruby-iconv' 'ruby-rexml')
optdepends=('ruby-gtk3: GTK+ GUI'
            'ruby-gettext: Translations'
            'cd-discid: Gnudb support'
            'lame: MP3 encoding support'
            'vorbis-tools: Ogg Vorbis encoding support'
            'flac: FLAC encoding support'
            'wavegain: WAV ReplayGain support'
            'mp3gain: MP3 ReplayGain support'
            'vorbisgain: Ogg Vorbis ReplayGain support'
            'aacgain-cvs: AAC ReplayGain support'
            'normalize: Normalization support'
            'cdrdao: Advanced TOC analysis'
            'sox: Correct pre-emphasis with sox'
            'wavpack: WavPack encoding and ReplayGain support'
            'opus-tools: Opus encoding support'
            'neroaacenc-bin: Nero AAC encoding support')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/bleskodev/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('5caf6e26427ae22ccc863789068bec807a964bfaa50c565562fad02a5ccfde0e')

build() {
  cd "${pkgname}-${pkgver}"

  ./configure --prefix='/usr' --enable-{cli,gtk3,lang-all} \
    --ruby="$(ruby -e 'v = RbConfig::CONFIG["vendorlibdir"] ; v["/usr"] = ""; puts v')"
}

package() {

  make DESTDIR="${pkgdir}" -C "${pkgname}-${pkgver}" install
}

# vim: ts=2 sw=2 et:
