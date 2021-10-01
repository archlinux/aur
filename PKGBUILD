# Maintainer: David Parrish <daveparrish@tutanota.com>

# shellcheck disable=SC2034,SC2164

pkgname=lando-bin
pkgver=3.3.2
pkgrel=3
pkgdesc="A free, open source, cross-platform, local development environment and DevOps tool built on Docker container technology"
arch=('x86_64')
url="https://docs.lando.dev/"
license=('GPL')
depends=('docker' 'docker-compose')
source_x86_64=("$pkgname-$pkgver.deb::https://github.com/lando/lando/releases/download/v$pkgver/lando-x64-v$pkgver.deb")
sha256sums_x86_64=('59fd4c8f41086bfae3308cca54402616802ed50dfa7b427cce5734acabeb8569')
conflicts=("lando")
provides=("lando")

# strip breaks executable
options=(!strip)

package(){
    # Extract package data
    tar xf data.tar.gz -C "${pkgdir}"

    # Don't need extra copy of docker-compose
    rm "${pkgdir}/usr/share/lando/bin/docker-compose"

    # Symlink important binary files
    mkdir -p "$pkgdir"/usr/bin
    ln -s /usr/share/lando/bin/lando "$pkgdir"/usr/bin/lando

    # For .desktop file (doesn't appear to be working)
    #mkdir -p "$pkgdir"/usr/share/lando
    #ln -s /usr/share/lando/bin/lando "$pkgdir"/usr/share/lando/Lando
    #mkdir -p "$pkgdir"/usr/share/pixmaps
    #ln -s /usr/share/lando/bin/lando.png "$pkgdir"/usr/share/pixmaps/lando.png
}
