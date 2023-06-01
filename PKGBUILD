# Maintainer: Matthew Sexton <matthew@asylumtech.com>
# Contributor: 0xMRTT <0xMRTT@proton.me>

pkgname=bavarder
pkgver=0.2.3
pkgrel=1
pkgdesc="Chit-Chat with AI"
arch=('any')
url="https://bavarder.codeberg.page"
license=('GPL3')
depends=(
    'libadwaita'
    'python-gobject'
    'python-lxml'
    'python-openai'
    'python-hgchat'
    'python-gtts'
    'python-baichat-py'
    'python-googlebardpy'
    'python-requests'
    'python-markdown'
    'pymdown-extensions'
    'webkitgtk-6.0'
)
makedepends=(
    'blueprint-compiler>=0.8.1'
    'meson'
)
checkdepends=('appstream-glib')
source=(${pkgname}-${pkgver}.tar.gz::https://codeberg.org/Bavarder/Bavarder/archive/${pkgver//_/-}.tar.gz)
b2sums=('9f9b7a53e4a3d5323deecba3460b5651151b622f23b9cbbf041d5786ab716d11995c483bf01feb231fb53ea7609d92d671744c770a2d0a1fb067b735ff78bf89')

build() {
  arch-meson "$pkgname" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"

  # fix binary permissions
  chmod 0755 "$pkgdir/usr/bin/$pkgname"
}
