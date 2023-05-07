# Maintainer: 0xMRTT <0xMRTT@proton.me>

pkgname=bavarder
_pkgname=Bavarder
pkgver=0.1.7
pkgrel=1
pkgdesc="Chit-Chat with AI"
arch=('x86_64')
url="https://codeberg.org/Bavarder/Bavarder"
license=('GPL3')
depends=('libadwaita' 'libsoup3' 'python-gobject' 'libportal-gtk4' 'python-openai' 'python-hgchat' 'python-baichat-py' 'python-googlebardpy')
makedepends=('meson' 'blueprint-compiler' 'gobject-introspection' )
checkdepends=('appstream-glib')
source=($url/archive/${pkgver//_/-}.tar.gz)
b2sums=('c869d0e4c8a4f1a452d24587970b994044493aecc028f8a2e4c0a26a7cd04b934afb17e2274a42ac8aac38deffe73e0ca6b6b12c4c8781b5eda6d3cb58768071')

pkgver() {
  cd "$pkgname"
  printf "$pkgver"
}

build() {
  arch-meson "$_pkgname-${pkgver//_/-}" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
