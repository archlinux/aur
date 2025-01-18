# Maintainer: zty012 <me@zty012.de>
# Maintainer: Littlefean <2385190373@qq.com>
pkgname=project-graph-git
pkgver=0.4.0
pkgrel=1
pkgdesc="A simple tool to create topology diagrams."
arch=('any')
url="https://github.com/LiRenTech/project-graph"
license=('mit')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk')
makedepends=('git' 'file' 'openssl' 'appmenu-gtk-module' 'libappindicator-gtk3' 'librsvg' 'base-devel' 'curl' 'wget' 'rustup' 'npm' 'nodejs' 'dpkg' 'pnpm')
provides=('project-graph')
conflicts=('project-graph-bin' 'project-graph-nightly-bin')
options=('!strip' '!emptydirs')
source=('git+https://github.com/LiRenTech/project-graph')
sha256sums=('SKIP')
prepare() {
  cd project-graph
  pnpm install
  pnpm run tauri build
}
package() {
  cd "$srcdir"/project-graph/src-tauri/target/release/bundle/deb
  dpkg-deb -x *.deb here
  cd here

  install -Dm755 usr/bin/project-graph "$pkgdir"/usr/bin/project-graph

  # Install desktop file
  install -Dm644 usr/share/applications/Project\ Graph.desktop "$pkgdir"/usr/share/applications/project-graph.desktop

  # Install icons
  install -Dm644 usr/share/icons/hicolor/128x128/apps/project-graph.png "$pkgdir"/usr/share/icons/hicolor/128x128/apps/project-graph.png
  install -Dm644 usr/share/icons/hicolor/256x256@2/apps/project-graph.png "$pkgdir"/usr/share/icons/hicolor/256x256@2/apps/project-graph.png
  install -Dm644 usr/share/icons/hicolor/32x32/apps/project-graph.png "$pkgdir"/usr/share/icons/hicolor/32x32/apps/project-graph.png
  # Extract package data
}

