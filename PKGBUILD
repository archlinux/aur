# Maintainer: Arne Fahrenwalde <macgeneral@macgeneral.de>
# Based on tracktion-waveform aur package from Mathias Buhr <napcode@aparatus.de>
# Based on waveforum-bundle aur package from Paul B Davis <paul@dangersalad.com>
# Based on tracktion-7 aur package from Felipe F. Tonello <eu@felipetonello.com>
# Based on tracktion-6 aur package from boltbuckle <amygdala@cheerful.com>

pkgname=tracktion-waveform-8
pkgver=8.2.7
pkgrel=2
pkgdesc="Audio and MIDI Workstation (DAW)"
arch=('x86_64')
url="https://www.tracktion.com/"
license=('custom')
depends=('alsa-lib' 'libcurl-compat' 'freetype2' 'libglvnd')
optdepends=(
  'jack: A low-latency audio server'
  'ladspa-plugins: A set of ladspa plugins'
)
conflicts=(
    'tracktion-waveform'
    'waveform-bundle'
    'tracktion-waveform-beta'
)
source=(https://cdn.tracktion.com/file/tracktiondownload/waveform/827/Waveform-installer-64bit-linux-8.2.7.deb)
md5sums=('95bd25b2d5fe551949ddd2ade8eafe0b')

package() {
    executable=Waveform8
    ar x "Waveform-installer-64bit-linux-$pkgver.deb"
    tar -x --lzma -f data.tar.lzma -C "${pkgdir}"
    install -D -m 644 "$startdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    sed "s/@executable@/$executable/g" "$startdir/tracktion-waveform" > "$pkgdir/usr/bin/$pkgname"
    chmod 755 "$pkgdir/usr/bin/$pkgname"
    sed -i "s/Exec=.*/Exec=$pkgname/" "$pkgdir/usr/share/applications/waveform8.desktop"
    mv "$pkgdir/usr/share/doc/waveform8" "$pkgdir/usr/share/doc/$pkgname"
}

