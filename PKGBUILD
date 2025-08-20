# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Eivind Eide <xenofil AT gmail DOT com>
# Contributor: Alexander F Rødseth <xyproto AT archlinux DOT org>
# Contributor: Maxime Gauduin <alucryd AT gmail DOT com>
# Contributor: Dave Reisner <dreisner AT archlinux DOT org>
# Contributor: Alexander Fehr <pizzapunk AT gmail DOT com>

pkgname=rubyripper
pkgver=0.8.0rc4
pkgrel=2
pkgdesc="Secure audiodisc ripper"
arch=(any)
url="https://github.com/bleskodev/rubyripper"
license=(GPL-3.0-only)
depends=(cdparanoia ruby ruby-rexml ruby-gettext ruby-gtk3 ruby-rake)
makedepends=(flac vorbis-tools lame wavegain cdrdao libcdio

			 # AUR
			 #cd-discid vorbisgain mp3gain normalize
)
checkdepends=(ruby-rspec ruby-base64)
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
            'neroaacenc-bin: Nero AAC encoding support')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('6ca2fa07bc891eb153d3f8adf992d7806a95dae0ae90d8f0c02d8b0435572a33')

build() {
  cd "${pkgname}-${pkgver}"
  ./configure \
    --prefix=/usr \
    --enable-cli \
    --enable-gtk3 \
    --enable-lang-all \
    --ruby="$(ruby -e 'v = RbConfig::CONFIG["vendorlibdir"] ; v["/usr"] = ""; puts v')"
}

check() {
  cd "${pkgname}-${pkgver}"
  rspec
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  ln -s /usr/bin/rrip_cli ${pkgdir}/usr/bin/rubyripper
}
