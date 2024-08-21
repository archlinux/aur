# Maintainer: Toni500 <tonino512@linuxmail.org>
pkgname="tabaur"
_pkgname="TabAUR"
pkgver=0.6.9
pkgrel=1
pkgdesc="A customizable and lightweight AUR helper, designed to be simple but powerful."
arch=('x86_64' 'aarch64')
url="https://github.com/BurntRanch/TabAUR"
license=('GPL2')
depends=('pacman' 'curl')
makedepends=('base-devel' 'cmake')
optdepends=(
  "sudo: privilege elevation"
  "opendoas: privilege elevation"
  "git: use AUR packages git repos"
  "tar: use AUR packages tarballs"
)
conflicts=('tabaur-git' 'tabaur-bin')
source=("git+${url}.git")
sha256sums=("SKIP")

prepare() {
    cd "${srcdir}/${_pkgname}"
    git checkout "v${pkgver}"
    git submodule init
    git submodule update --init --recursive
}

# there is no need for build() because `make install` already builds and install TabAUR
package() {
    cd "${srcdir}/${_pkgname}"
    make install DESTDIR="${pkgdir}" PREFIX="/usr" DEBUG=0
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
