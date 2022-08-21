# Maintainer: robertfoster
# Contributor: Gustavo6046

pkgbase=iortcw-git
pkgname=iortcw-git
pkgver=1.51c.r89.gbbd32eed
pkgrel=1
pkgdesc="Merge of ioquake3 features and fixes into Return to Castle Wolfenstein"
arch=('i686' 'x86_64')
url="https://github.com/iortcw/iortcw"
license=('GPL3')
depends=('freetype2' 'graphite' 'harfbuzz' 'iortcw-data' 'libjpeg-turbo' 'libogg' 'openal' 'opus' 'opusfile' 'pcre' 'sdl2' 'zlib')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
makedepends=('git')
source=("git+${url}"
  'iortcw-ded.launcher'
  'iortcw-sp.launcher'
  'iortcw-mp.launcher'
  'iortcw-sp.desktop'
  'iortcw-mp.desktop'
)

pkgver() {
  cd "${srcdir}/iortcw"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/iortcw"

  # Build Single Player
  cd SP
  make USE_INTERNAL_LIBS=0

  # Build Multi Player
  cd ../MP
  make USE_INTERNAL_LIBS=0
}

package() {
  cd "${srcdir}/iortcw"

  cd SP
  make USE_INTERNAL_LIBS=0 \
    COPYDIR="${pkgdir}/opt/iortcw" copyfiles

  cd ../MP
  make USE_INTERNAL_LIBS=0 \
    COPYDIR="${pkgdir}/opt/iortcw" copyfiles

  ln -s -r /opt/iortcw-data/pak0.pk3 \
    "${pkgdir}/opt/iortcw/main"
  ln -s -r /opt/iortcw-data/sp_pak1.pk3 \
    "${pkgdir}/opt/iortcw/main"
  ln -s -r /opt/iortcw-data/mp_pak0.pk3 \
    "${pkgdir}/opt/iortcw/main"

  ln -s -r /opt/iortcw-data/mp_bin.pk3 \
    "${pkgdir}/opt/iortcw/main"
  ln -s -r /opt/iortcw-data/mp_pak1.pk3 \
    "${pkgdir}/opt/iortcw/main"
  ln -s -r /opt/iortcw-data/mp_pak2.pk3 \
    "${pkgdir}/opt/iortcw/main"
  ln -s -r /opt/iortcw-data/mp_pak3.pk3 \
    "${pkgdir}/opt/iortcw/main"
  ln -s -r /opt/iortcw-data/mp_pak4.pk3 \
    "${pkgdir}/opt/iortcw/main"
  ln -s -r /opt/iortcw-data/mp_pak5.pk3 \
    "${pkgdir}/opt/iortcw/main"
  ln -s -r /opt/iortcw-data/mp_pakmaps0.pk3 \
    "${pkgdir}/opt/iortcw/main"
  ln -s -r /opt/iortcw-data/mp_pakmaps1.pk3 \
    "${pkgdir}/opt/iortcw/main"
  ln -s -r /opt/iortcw-data/mp_pakmaps2.pk3 \
    "${pkgdir}/opt/iortcw/main"
  ln -s -r /opt/iortcw-data/mp_pakmaps3.pk3 \
    "${pkgdir}/opt/iortcw/main"
  ln -s -r /opt/iortcw-data/mp_pakmaps4.pk3 \
    "${pkgdir}/opt/iortcw/main"
  ln -s -r /opt/iortcw-data/mp_pakmaps5.pk3 \
    "${pkgdir}/opt/iortcw/main"
  ln -s -r /opt/iortcw-data/mp_pakmaps6.pk3 \
    "${pkgdir}/opt/iortcw/main"
  ln -s -r /opt/iortcw-data/sp_pak2.pk3 \
    "${pkgdir}/opt/iortcw/main"
  ln -s -r /opt/iortcw-data/sp_pak3.pk3 \
    "${pkgdir}/opt/iortcw/main"
  ln -s -r /opt/iortcw-data/sp_pak4.pk3 \
    "${pkgdir}/opt/iortcw/main"

  ln -s -r /opt/iortcw-data/openurl.sh \
    "${pkgdir}/opt/iortcw/openurl.sh"

  # Modify Launcher Scripts
  if [ "$CARCH" = "x86_64" ]; then

    # x86_64 Systems
    TARGET=x86_64
  else
    # i686 Systems
    TARGET=x86
  fi

  sed -i "s:ARCH:$TARGET:" \
    "${srcdir}"/iortcw-sp.*
  sed -i "s:ARCH:$TARGET:" \
    "${srcdir}"/iortcw-mp.*
  sed -i "s:ARCH:$TARGET:" \
    "${srcdir}"/iortcw-ded.*

  # Install Launcher Script (Single Player Client)
  install -D -m 755 ${srcdir}/iortcw-sp.launcher \
    "${pkgdir}/usr/bin/iortcw-sp"

  # Install Launcher Script (Multi Player Client)
  install -D -m 755 "${srcdir}/iortcw-mp.launcher" \
    "${pkgdir}/usr/bin/iortcw-mp"

  # Install Launcher Script (Dedicated Server)
  install -D -m 755 "${srcdir}/iortcw-ded.launcher" \
    "${pkgdir}/usr/bin/iortcw-ded"

  # Install Desktop File (Single Player)
  install -D -m 644 "${srcdir}/iortcw-sp.desktop" \
    "${pkgdir}/usr/share/applications/iortcw-sp.desktop"

  # Install Desktop File (Multi Player)
  install -D -m 644 "${srcdir}/iortcw-mp.desktop" \
    "${pkgdir}/usr/share/applications/iortcw-mp.desktop"

  # Install Icon File (Single Player)
  install -D -m 644 "${srcdir}/iortcw/SP/misc/iortcw.svg" \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/iortcw.svg"
}

sha256sums=('SKIP'
  '4af024d025009cb3c39fb6137d10a417167c6b026f82e162aaea583d0b4934d2'
  'ab55a395fa2e164f655cba91dd197d98697621d5cdd2cfb30e8f06f49fc2b5d2'
  '13dacae097c252609e2931eb799d79e07da31403fb2b0b6cde16fa7237d8d3d7'
  '43c7450c9c2c25051ae74b28a0b81ce17d1e9e6e33949954460a186ba6605257'
  'f2beab09c7972625098c9166957cafe35b9ac1cc9ce8e59bd8c8bd2b173d851b')
