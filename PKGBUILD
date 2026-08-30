# Maintainer: robertfoster
# Contributor: tuxsavvy

pkgname=realrtcw
pkgver=5.44c # renovate: datasource=github-tags depName=wolfetplayer/RealRTCW
pkgrel=1
pkgdesc="An overhaul mod for critically acclaimed Return To Castle Wolfenstein."
arch=('aarch64' 'i686' 'x86_64')
url="http://www.moddb.com/mods/realrtcw-realism-mod"
license=('GPL')
depends=('freetype2' 'graphite' 'harfbuzz' 'iortcw-data' 'libjpeg-turbo' 'libogg' 'openal' 'opus' 'opusfile' 'pcre' 'sdl3' 'zlib')
install='realrtcw.install'
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/wolfetplayer/RealRTCW/archive/refs/tags/${pkgver}.tar.gz"
  "${pkgname}.png"
  "${pkgname}.launcher"
  "${pkgname}.desktop"
)

package() {
  cd "${srcdir}/RealRTCW-${pkgver}"

  USE_INTERNAL_LIBS=0 \
    COPYDIR=${pkgdir}/opt/realrtcw \
    make copyfiles

  ln -s /opt/iortcw-data/pak0.pk3 \
    "${pkgdir}/opt/realrtcw/main"
  ln -s /opt/iortcw-data/sp_pak1.pk3 \
    "${pkgdir}/opt/realrtcw/main"
  ln -s /opt/iortcw-data/mp_pak0.pk3 \
    "${pkgdir}/opt/realrtcw/main"

  ln -s /opt/iortcw-data/mp_bin.pk3 \
    "${pkgdir}/opt/realrtcw/main"
  ln -s /opt/iortcw-data/mp_pak1.pk3 \
    "${pkgdir}/opt/realrtcw/main"
  ln -s /opt/iortcw-data/mp_pak2.pk3 \
    "${pkgdir}/opt/realrtcw/main"
  ln -s /opt/iortcw-data/mp_pak3.pk3 \
    "${pkgdir}/opt/realrtcw/main"
  ln -s /opt/iortcw-data/mp_pak4.pk3 \
    "${pkgdir}/opt/realrtcw/main"
  ln -s /opt/iortcw-data/mp_pak5.pk3 \
    "${pkgdir}/opt/realrtcw/main"
  ln -s /opt/iortcw-data/mp_pakmaps0.pk3 \
    "${pkgdir}/opt/realrtcw/main"
  ln -s /opt/iortcw-data/mp_pakmaps1.pk3 \
    "${pkgdir}/opt/realrtcw/main"
  ln -s /opt/iortcw-data/mp_pakmaps2.pk3 \
    "${pkgdir}/opt/realrtcw/main"
  ln -s /opt/iortcw-data/mp_pakmaps3.pk3 \
    "${pkgdir}/opt/realrtcw/main"
  ln -s /opt/iortcw-data/mp_pakmaps4.pk3 \
    "${pkgdir}/opt/realrtcw/main"
  ln -s /opt/iortcw-data/mp_pakmaps5.pk3 \
    "${pkgdir}/opt/realrtcw/main"
  ln -s /opt/iortcw-data/mp_pakmaps6.pk3 \
    "${pkgdir}/opt/realrtcw/main"
  ln -s /opt/iortcw-data/sp_pak2.pk3 \
    "${pkgdir}/opt/realrtcw/main"
  ln -s /opt/iortcw-data/sp_pak3.pk3 \
    "${pkgdir}/opt/realrtcw/main"
  ln -s /opt/iortcw-data/sp_pak4.pk3 \
    "${pkgdir}/opt/realrtcw/main"

  ln -s /opt/iortcw-data/openurl.sh \
    "${pkgdir}/opt/realrtcw/openurl.sh"

  # Modify Launcher Scripts
  case "$CARCH" in
    x86_64) TARGET=x86_64 ;;
    aarch64) TARGET=aarch64 ;;
    i686) TARGET=x86 ;;
    *)
      error "Unsupported architecture: $CARCH"
      ;;
  esac
  sed -i "s:ARCH:${TARGET}:" \
    "${srcdir}"/realrtcw.*

  # Install Launcher Script (Single Player Client)
  install -D -m 755 "${srcdir}/realrtcw.launcher" \
    "${pkgdir}/usr/bin/realrtcw"

  # Install Desktop File (Single Player)
  install -D -m 644 "${srcdir}/realrtcw.desktop" \
    "${pkgdir}/usr/share/applications/realrtcw.desktop"

  # Install Icon File (Single Player)
  install -Dm 644 "${srcdir}/realrtcw.png" \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/realrtcw.png"
}

sha256sums=(
  'ef8ac21a7eca67cb9a4d4dfe876c14758df9213ef6f8a92b050afcc441f5d550'
  '643bd2a56b06fbdf9790b3bb7557c7f6663cc3e86295431f6470b347e37b4bb2'
  'e68d6f400342e36d3db94e519978da0afa2d74f3368b1fe88014c4bdb26b193e'
  '43501d60c80ae4a2837295fb5faf01d42e31f31371fcd6cecc8054eed965b8f6'
)
