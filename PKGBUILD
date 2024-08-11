# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Eivind Eide <xenofil AT gmail DOT com>
# Contributor: Alexander F Rødseth <xyproto AT archlinux DOT org>
# Contributor: Maxime Gauduin <alucryd AT gmail DOT com>
# Contributor: Dave Reisner <dreisner AT archlinux DOT org>
# Contributor: Alexander Fehr <pizzapunk AT gmail DOT com>

pkgname=rubyripper-git
pkgver=0.8.0rc3.r12.gc19661b
pkgrel=1
pkgdesc="Secure audiodisc ripper"
arch=(any)
url="https://github.com/bleskodev/rubyripper"
license=(GPL3)
depends=(cdparanoia ruby) #ruby-iconv ruby-rexml ruby-gtk3
makedepends=(git ruby-gettext)
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
provides=(rubyripper)
conflicts=(rubyripper)
source=("git+https://github.com/bleskodev/rubyripper.git")
sha256sums=('SKIP')

pkgver() {
  cd "rubyripper"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "rubyripper"

  ./configure \
    --prefix=/usr \
    --enable-cli \
    --disable-gtk3 \
    --enable-lang-all} \
    --ruby="$(ruby -e 'v = RbConfig::CONFIG["vendorlibdir"] ; v["/usr"] = ""; puts v')"
}

package() {
  cd "rubyripper"
  make DESTDIR="${pkgdir}" install
}
