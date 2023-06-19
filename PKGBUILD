# Maintainer: Matthew Sexton <matthew@asylumtech.com>
# Contributor: 0xMRTT <0xMRTT@proton.me>

pkgname=bavarder
pkgver=0.2.4
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
b2sums=('49605e7145ed657c58c94cbefb5f5c52c46adb40e4a59ea53baadc0d5055e228fdb961a1c9b801a59c075aa1f44e5f0db46be9030f8e77b6a5f9c0869793639d')

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
