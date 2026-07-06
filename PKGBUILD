# Maintainer: smiley <smiley@aur.archlinux.org>

pkgname=cosmic-ext-applet-logomenu
pkgver=0.7.1
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
sha256sums=('a15fc42d7e7b7e2a7acb6810d85ef1bb9cbc6210c2b67e976c7a1972e54fe629')

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
