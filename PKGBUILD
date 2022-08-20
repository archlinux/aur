# Maintainer: Francisco Carpio <carpiofj@gmail.com>

pkgname=phosh-antispam
pkgver=2.1.1
pkgrel=1
pkgdesc='Phosh Calls Anti-Spam'
arch=('x86_64' 'aarch64')
url="https://gitlab.com/kop316/phosh-antispam"
license=('GPL3')
depends=(
  'gnome-calls'
)
makedepends=(
  'gcc'
  'glib2'
  'libhandy'
  'meson'
  'docbook-xml'
  'docbook-xsl'
)
_commit=${pkgver}
source=("${url}/-/archive/${_commit}/${pkgname}-${_commit}.tar.gz")
sha256sums=('a7d047289b1cebcdbe6bd945679666f158806d06382864f0d557f41424e281f5')

build() {
  cd "${pkgname}-${_commit}"
  meson _build -Dprefix=/usr --sysconfdir=/etc
  meson compile -C _build
}

check() {
  cd "${pkgname}-${_commit}"
  meson test -C _build
}

package() {
  cd "${pkgname}-${_commit}"
  meson install -C _build --destdir "${pkgdir}"
}