# Maintainer: 0xMRTT <0xMRTT@proton.me>

pkgname=bavarder
_pkgname=Bavarder
pkgver=0.2.0
pkgrel=2
pkgdesc="Chit-Chat with AI"
arch=('any')
url="https://bavarder.codeberg.page"
license=('GPL3')
depends=('libadwaita' 'python-gobject' 'python-openai' 'python-hgchat' 'python-gtts' 'python-baichat-py' 'python-googlebardpy'
         'python-requests')
makedepends=('blueprint-compiler' 'meson')
checkdepends=('appstream-glib')
source=(https://codeberg.org/Bavarder/Bavarder/archive/${pkgver//_/-}.tar.gz)
b2sums=('fced8887f711294f5191caeaf3e089d14b36943dbae90a30b99541a967ae2cb0d9a587e22a6948a84f600e8771f3173fc0774907a70560c257cda51f8d2e2cea')

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
