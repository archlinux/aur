# Maintainer: smiley <smiley@aur.archlinux.org>

pkgname=cosmic-ext-applet-logomenu
pkgver=0.8.0
pkgrel=1
pkgdesc='Logo Menu applet for the COSMIC desktop'
arch=('x86_64' 'aarch64')
url='https://github.com/cosmic-utils/cosmic-ext-applet-logomenu'
license=('GPL-3.0-or-later')
depends=('cosmic-applets')
makedepends=('cargo' 'just' 'git')
conflicts=('cosmic-ext-applet-logomenu-git')
provides=('cosmic-ext-applet-logomenu')
source=("https://github.com/cosmic-utils/cosmic-ext-applet-logomenu/archive/v${pkgver}.tar.gz")
sha256sums=('9e0c3dfd9faeddc70229791f23961c9f91851427afc74ae3f9f58f651025c1b8')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  just build-release --frozen
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  just rootdir="$pkgdir" install
}
