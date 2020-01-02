# Maintainer:  Eivind Eide <xenofil AT gmail DOT com>
# Contributor: Alexander F Rødseth <xyproto AT archlinux DOT org>
# Contributor: Maxime Gauduin <alucryd AT gmail DOT com>
# Contributor: Dave Reisner <dreisner AT archlinux DOT org>
# Contributor: Alexander Fehr <pizzapunk AT gmail DOT com>

pkgname=rubyripper
pkgver=0.7.0rc2
pkgrel=3
pkgdesc='Secure audiodisc ripper'
arch=('any')
url='http://code.google.com/p/rubyripper/'
license=('GPL3')
depends=('cdparanoia' 'gtk2' 'ruby-iconv' 'ruby-gettext')
optdepends=('ruby-gtk2: GTK+ GUI'
            'cd-discid: Freedb support'
            'lame: MP3 encoding support'
            'vorbis-tools: Ogg Vorbis encoding support'
            'flac: FLAC encoding support'
            'wavegain: WAV ReplayGain support'
            'mp3gain: MP3 ReplayGain support'
            'vorbisgain: Ogg Vorbis ReplayGain support'
            'normalize: Normalization support'
            'cdrdao: Advanced TOC analysis'
            'sox: Correct pre-emphasis with sox'
            'wavpack: WavPack encoding support'
            'opus-tools: Opus encoding support'
            'neroaacenc-bin: Nero AAC encoding support')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/bleskodev/rubyripper/archive/v${pkgver}.tar.gz")
sha256sums=('977089c4a262936f9acf82ad1ab5932de97523ba31b61b5ccc1279a94eaea6ae')

build() {
  cd "${pkgname}-${pkgver}"

  ./configure --prefix='/usr' --enable-{cli,gtk2,lang-all} \
    --ruby="$(ruby -e 'v = RbConfig::CONFIG["vendorlibdir"] ; v["/usr"] = ""; puts v')"
}

package() {

  make DESTDIR="${pkgdir}" -C "${pkgname}-${pkgver}" install
}

# vim: ts=2 sw=2 et:
