# Maintainer: 0xMRTT <0xMRTT@proton.me>

pkgname=bavarder
_pkgname=Bavarder
pkgver=0.2.2
pkgrel=2
pkgdesc="Chit-Chat with AI"
arch=('any')
url="https://bavarder.codeberg.page"
license=('GPL3')
depends=('libadwaita' 'python-gobject' 'python-lxml' 'python-openai' 'python-hgchat' 'python-gtts' 'python-baichat-py' 'python-googlebardpy'
         'python-requests')
makedepends=('blueprint-compiler' 'meson')
checkdepends=('appstream-glib')
source=(https://codeberg.org/Bavarder/Bavarder/archive/${pkgver//_/-}.tar.gz)
b2sums=('6feb5212bf052fdb8f87525df4277ba990b6a536df45412bebf6ef8e0251662e837e4d5b87c8e898e2644664744982e2cdbe16ed1f980ffb5027b5dda3af6d8c')

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
