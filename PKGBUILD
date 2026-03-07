# Maintainer: ravencrow <ravencrowonyt@icloud.com>

pkgbase=spectacle-trayicon-git
pkgname=('spectacle-trayicon-git')
pkgver=1.1.0.r0.g0000000
pkgrel=1
pkgdesc="System tray icon for Spectacle with quick capture modes and persistent settings"
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
install='spectacle-trayicon.install'
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/spectacle-sni"
  printf "1.1.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/spectacle-sni"

  install -Dm755 spectacle-trayicon.py "${pkgdir}/usr/bin/spectacle-trayicon"
  install -Dm644 packaging/spectacle-trayicon.desktop "${pkgdir}/usr/share/applications/spectacle-trayicon.desktop"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
