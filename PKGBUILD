# Maintainer: Masterisk-F <masterisk-f [at] proton DOT me>
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Eivind Eide <xenofil AT gmail DOT com>
# Contributor: Alexander F Rødseth <xyproto AT archlinux DOT org>
# Contributor: Maxime Gauduin <alucryd AT gmail DOT com>
# Contributor: Dave Reisner <dreisner AT archlinux DOT org>
# Contributor: Alexander Fehr <pizzapunk AT gmail DOT com>
pkgname=rubyripperremix
pkgver=0.8.0rc4_0.4.0
pkgrel=1
pkgdesc="Secure audiodisc ripper with AccurateRip and CTDB verification (Fork of rubyripper)"
arch=('any')
url="https://github.com/Masterisk-F/RubyRipperRemix"
license=(GPL-3.0-only)
depends=('libcdio-paranoia' 'ruby' 'ruby-rexml' 'ruby-gtk3' 'ruby-gettext' 'ruby-parallel' 'ruby-rake' 'ruby-base64')
makedepends=()
optdepends=('cd-discid: Gnudb support'
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
            'neroaacenc-bin: Nero AAC encoding support'
            'ctdb-cli: CUETools Database verification and submittion support')
source=("$pkgname-v$pkgver.tar.gz::https://github.com/Masterisk-F/RubyRipperRemix/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e297300a38634aa0a18336a8cb8443100e7c280d14afdc2bdf27654cd076ef81')

build() {
  cd "RubyRipperRemix-$pkgver"
  ./configure \
    --prefix=/usr \
    --enable-cli \
    --enable-gtk3 \
    --enable-lang-all \
    --ruby="$(ruby -e 'v = RbConfig::CONFIG["vendorlibdir"] ; v["/usr"] = ""; puts v')"
}

package() {
  cd "RubyRipperRemix-$pkgver"
  make DESTDIR="${pkgdir}" install
  
  # Create a symlink for backward compatibility
  #ln -s /usr/bin/rrr "${pkgdir}/usr/bin/rubyripper"
}
