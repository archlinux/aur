# Maintainer: Matthew Sexton <matthew@asylumtech.com>
# Contributor: 0xMRTT <0xMRTT@proton.me>

pkgname=bavarder
pkgver=0.2.2
pkgrel=6
pkgdesc="Chit-Chat with AI"
arch=('any')
url="https://bavarder.codeberg.page"
license=('GPL3')
depends=('libadwaita' 'python-gobject' 'python-lxml' 'python-openai' 'python-hgchat' 'python-gtts' 'python-baichat-py' 'python-googlebardpy' 'python-requests' 'webkitgtk-6.0')
makedepends=('blueprint-compiler>=0.8.1' 'meson')
checkdepends=('appstream-glib')
source=(${pkgname}-${pkgver}.tar.gz::https://codeberg.org/Bavarder/Bavarder/archive/${pkgver//_/-}.tar.gz)
b2sums=('af568bab0efb730406e01d8057db6256828ec61345f4a18eaef0e0bfc1fcf8e6f8dde8ad835d77cb2bdc1e2c009ca14652f28a23ec2af0dcc7863cabfb194ab9')

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
