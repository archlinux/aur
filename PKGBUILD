# Maintainer: Mathias Buhr <napcode@aparatus.de>
# Based on waveforum-bundle aur package from Paul B Davis <paul@dangersalad.com>
# Based on tracktion-7 aur package from Felipe F. Tonello <eu@felipetonello.com>
# Based on tracktion-6 aur package from boltbuckle <amygdala@cheerful.com>

pkgname=tracktion-waveform
pkgver=12.1.3
pkgrel=2
pkgdesc="Audio and MIDI Workstation (DAW)"
arch=('x86_64' 'armv7l' 'aarch64')
url="https://www.tracktion.com/"
license=('custom')
depends=('gcc-libs'
  'alsa-lib'
  'curl'
  'freetype2'
  'libglvnd'
  'zlib'
  'bzip2'
  'libpng'
  'harfbuzz'
  'brotli'
  'graphite'
  'glib2'
  'libx11'
  'libxcb'
  'libxau'
  'libxdmcp'
  'pcre'
)
optdepends=(
  'jack: A low-latency audio server'
  'ladspa-plugins: A set of ladspa plugins'
  'vst-plugins: A set of vst plugins'
  'vst3-plugins: A set of vst3 plugins'
)
conflicts=(
  'waveform-bundle'
  'tracktion-waveform-beta'
)

# Tracktion did not publish ARM builds for the pkgver yet! Hence, using hardcoded versions here.
source_aarch64=(https://cdn.tracktion.com/file/tracktiondownload/waveform/1157/waveform_pi_32bit_v11.5.7.deb)
source_armv7l=(https://cdn.tracktion.com/file/tracktiondownload/waveform/1157/waveform_pi_64bit_v11.5.7.deb)
source_x86_64=(https://cdn.tracktion.com/file/tracktiondownload/w12/${pkgver//./}/waveform_64bit_v${pkgver}.deb)
sha256sums_x86_64=('2deffb6d22cbb2c72f664e1f6e65af0426fadf203e6eff26089112d865fca02a')
sha256sums_armv7l=('20fb190be082173f0d17937286762de42031d6b291b3b4db5a62618f0ed7098a')
sha256sums_aarch64=('f65a29d441061a3a674b1893d39d5eb85f000832d7948e8fd67dbeca2d127674')

package() {
    tar -x --xz -f data.tar.xz -C "${pkgdir}"
    install -D -m 644 "$startdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    mv "$pkgdir/usr/share/doc/waveform12" "$pkgdir/usr/share/doc/$pkgname"
}
