# Maintainer: Zachary <22am014@sctce.ac.in>

_pkgname=linear-linux
pkgname=linear-desktop-git
pkgver=r18.c728b3a
pkgrel=1
pkgdesc="Unofficial Linux desktop client for Linear (linear.app), built with Tauri"
arch=('x86_64')
url="https://github.com/zacharyftw/linear-linux"
license=('ISC')
depends=(
  'cairo'
  'desktop-file-utils'
  'gcc-libs'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gtk3'
  'hicolor-icon-theme'
  'libsoup3'
  'openssl'
  'pango'
  'webkit2gtk-4.1'
)
makedepends=('git' 'rust' 'nodejs' 'pnpm' 'librsvg' 'openssl')
provides=('linear-desktop')
conflicts=('linear-desktop' 'linear-desktop-bin')
options=(!lto)
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${_pkgname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd ${_pkgname}
  pnpm install
}

build() {
  cd ${_pkgname}
  pnpm tauri build -b deb
}

package() {
  cd ${_pkgname}
  cp -a src-tauri/target/release/bundle/deb/*/data/* "${pkgdir}"
}
