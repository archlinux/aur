# Maintainer:  Eivind Eide <xenofil AT gmail DOT com>
# Contributor: Alexander F Rødseth <xyproto AT archlinux DOT org>
# Contributor: Maxime Gauduin <alucryd AT gmail DOT com>
# Contributor: Dave Reisner <dreisner AT archlinux DOT org>
# Contributor: Alexander Fehr <pizzapunk AT gmail DOT com>

pkgname=rubyripper
pkgver=0.8.0rc3
pkgrel=2
pkgdesc='Secure audiodisc ripper'
arch=('any')
url='https://github.com/bleskodev/rubyripper'
license=('GPL3')
depends=('cdparanoia' 'ruby-iconv' 'ruby-rexml' 'ruby-gtk3')
optdepends=('ruby-gettext: Translations'
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
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('f109ed5455f5a616cbd392c2a71efd59ffa2d207c3c3c3ad41873e20430b80c0')

build() {
  cd "${pkgname}-${pkgver}"

  ./configure --prefix='/usr' --enable-{cli,gtk3,lang-all} \
    --ruby="$(ruby -e 'v = RbConfig::CONFIG["vendorlibdir"] ; v["/usr"] = ""; puts v')"
}

package() {

  make DESTDIR="${pkgdir}" -C "${pkgname}-${pkgver}" install
}

# vim: ts=2 sw=2 et:
