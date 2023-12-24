# Maintainer: Matthew Sexton <matthew@asylumtech.com>
# Contributor: 0xMRTT <0xMRTT@proton.me>

pkgname=bavarder
pkgver=1.0.0
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
    'python-fake-useragent'
    'python-curl-cffi'
    'libportal'
    'gtksourceview5'
)
makedepends=(
    'blueprint-compiler>=0.8.1'
    'meson'
)
checkdepends=('appstream-glib')
source=(${pkgname}-${pkgver}.tar.gz::https://codeberg.org/Bavarder/Bavarder/archive/${pkgver//_/-}.tar.gz)
b2sums=('79a8ce6228450150e3ea7f2d93faaee97ae942648255475b1d777d5af663028b9fd1e0b0ee424b62c749122e81ee0b682a7ec243daca636260566c548d8b6ade')

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
