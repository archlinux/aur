# Maintainer: ravencrow <ravencrowonyt@icloud.com>

pkgbase=spectacle-trayicon-git
pkgname=('spectacle-trayicon-git')
pkgver=0
pkgrel=1
pkgdesc="KDE Plasma system tray icon for Spectacle screenshot tool with quick capture modes"
arch=('any')
url="https://github.com/ravencrowonyt/spectacle-sni"
license=('MIT')

depends=(
  'python'
  'python-pydbus'
  'python-gobject'
  'libdbusmenu-glib'
  'gobject-introspection'
  'spectacle'
)

makedepends=('git')

provides=('spectacle-trayicon')
conflicts=('spectacle-trayicon' 'spectacle-sni-git')

options=('!strip')

install='spectacle-trayicon.install'

source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/spectacle-sni"

  if git describe --long --tags --abbrev=7 >/dev/null 2>&1; then
    git describe --long --tags --abbrev=7 | \
      sed 's/^v//' | sed 's/\([^-]*-g\)/r\1/' | tr '-' '.'
  else
    printf "0.r%s.g%s" \
      "$(git rev-list --count HEAD)" \
      "$(git rev-parse --short HEAD)"
  fi
}

package() {
  cd "${srcdir}/spectacle-sni"

  install -Dm755 spectacle-trayicon.py \
    "${pkgdir}/usr/bin/spectacle-trayicon"

  install -Dm644 packaging/spectacle-trayicon.desktop \
    "${pkgdir}/usr/share/applications/spectacle-trayicon.desktop"

  install -Dm644 packaging/spectacle-trayicon.autostart.desktop \
    "${pkgdir}/usr/share/doc/${pkgname}/spectacle-trayicon.autostart.desktop"

  install -Dm644 LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
