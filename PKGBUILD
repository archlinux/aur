# Maintainer: duanluan <duanluan@outlook.com>

pkgname=rebased-bin
_pkgname=rebased
pkgver=1.0.8
_build=261.22158.SNAPSHOT
pkgrel=1
pkgdesc='Standalone JetBrains-based Git client (prebuilt binary)'
arch=('x86_64')
url='https://github.com/DetachHead/rebased'
license=('Apache-2.0')
depends=('fontconfig' 'giflib' 'hicolor-icon-theme' 'libdbusmenu-glib' 'ttf-font')
optdepends=('xdg-utils: open URLs from the IDE')
provides=('rebased')
conflicts=('rebased')
options=('!strip')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/DetachHead/rebased/releases/download/1.0.8/ideaIC-261.22158.SNAPSHOT.tar.gz")
sha256sums=('ee48969d3679aa1d89e98801c6ba79ce4c7edd65ca8ed3581d8fc33f6f887cbc')

package() {
  install -dm755 "${pkgdir}/opt/${_pkgname}"
  cp -a "${srcdir}/idea-IC-261.22158.SNAPSHOT/." "${pkgdir}/opt/${_pkgname}/"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/${_pkgname}/bin/idea" "${pkgdir}/usr/bin/rebased"

  install -Dm644 "${srcdir}/idea-IC-261.22158.SNAPSHOT/bin/idea.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/rebased.svg"
  install -Dm644 "${srcdir}/idea-IC-261.22158.SNAPSHOT/bin/idea.png" "${pkgdir}/usr/share/pixmaps/rebased.png"
  install -Dm644 "${srcdir}/idea-IC-261.22158.SNAPSHOT/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
  install -Dm644 "${srcdir}/idea-IC-261.22158.SNAPSHOT/NOTICE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE.txt"

  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/rebased.desktop" <<'DESKTOP'
[Desktop Entry]
Type=Application
Version=1.0
Name=Rebased
Comment=Standalone Git client based on the IntelliJ platform
Exec=rebased %f
Icon=rebased
Terminal=false
StartupNotify=true
StartupWMClass=jetbrains-rebased
Categories=Development;IDE;VersionControl;
Keywords=git;vcs;jetbrains;
DESKTOP
}
