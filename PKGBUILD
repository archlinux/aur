# Maintainer: Markus

pkgname=tone3000-bin
pkgver=0.0.9
pkgrel=1
pkgdesc='Standalone and audio plug-ins for playing Neural Amp Modeler captures and impulse responses'
arch=('x86_64')
url='https://github.com/tone-3000/tone3000-plugin'
license=('custom')
depends=('alsa-lib' 'curl' 'fontconfig' 'freetype2' 'gtk3' 'libx11' 'webkit2gtk-4.1')
provides=('tone3000-clap' 'tone3000-lv2' 'tone3000-vst3')
source=("${pkgname}-${pkgver}-linux-x64.tar.gz::https://github.com/tone-3000/tone3000-plugin/releases/download/v${pkgver}/TONE3000-v${pkgver}-linux-x64.tar.gz")
sha256sums=('3e23fb63965f310834090c1cae0357ea0b279cfc14d6980e3beb0b7b5a54b546')

package() {
  local _src="${srcdir}/TONE3000-v${pkgver}-linux-x64"

  install -Dm755 "${_src}/TONE3000" "${pkgdir}/usr/bin/TONE3000"
  install -Dm644 "${_src}/TONE3000.clap" "${pkgdir}/usr/lib/clap/TONE3000.clap"
  install -Dm644 "${_src}/tone3000.png" \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/tone3000.png"

  install -d "${pkgdir}/usr/lib/lv2"
  cp -r "${_src}/TONE3000.lv2" "${pkgdir}/usr/lib/lv2/"

  install -d "${pkgdir}/usr/lib/vst3"
  cp -r "${_src}/TONE3000.vst3" "${pkgdir}/usr/lib/vst3/"

  install -d "${pkgdir}/usr/share/TONE3000/Presets/Factory"
  install -m644 "${_src}"/factory-presets/*.t3kpreset \
    "${pkgdir}/usr/share/TONE3000/Presets/Factory/"

  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/tone3000.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=TONE3000
Comment=Play NAM captures and impulse responses
Exec=TONE3000
Icon=tone3000
Terminal=false
Categories=AudioVideo;Audio;Music;
StartupWMClass=TONE3000
EOF
}
