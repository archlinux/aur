# Maintainer: Mathias Buhr <napcode@aparatus.de>
# Based on waveforum-bundle aur package from Paul B Davis <paul@dangersalad.com>
# Based on tracktion-7 aur package from Felipe F. Tonello <eu@felipetonello.com>
# Based on tracktion-6 aur package from boltbuckle <amygdala@cheerful.com>

pkgname=tracktion-waveform
pkgver=9.1.1
pkgrel=1
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
    'waveform-bundle'
    'tracktion-waveform-beta'
)
source=(https://cdn.tracktion.com/file/tracktiondownload/waveform/911/Waveform-installer-64bit-linux-9.1.1.deb)
md5sums=('4b72ff15a96b6e9458bd93ed3bffb914')

package() {
    executable=Waveform9
    tar -x --lzma -f data.tar.lzma -C "${pkgdir}"
    install -D -m 644 "$startdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    sed "s/@executable@/$executable/g" "$startdir/tracktion-waveform" > "$pkgdir/usr/bin/$pkgname"
    chmod 755 "$pkgdir/usr/bin/$pkgname"
    sed -i "s/Exec=.*/Exec=$pkgname/" "$pkgdir/usr/share/applications/waveform9.desktop"
    mv "$pkgdir/usr/share/doc/waveform9" "$pkgdir/usr/share/doc/$pkgname"
}
