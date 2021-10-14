# Maintainer: David Parrish <daveparrish@tutanota.com>

# shellcheck disable=SC2034,SC2164

pkgname=lando-bin
pkgver=3.4.2
pkgrel=2
pkgdesc="A free, open source, cross-platform, local development environment and DevOps tool built on Docker container technology"
arch=('x86_64')
url="https://docs.lando.dev/"
license=('GPL')
depends=('docker' 'docker-compose')
source_x86_64=("$pkgname-$pkgver.deb::https://github.com/lando/lando/releases/download/v$pkgver/lando-x64-v$pkgver.deb")
sha256sums_x86_64=('54463e75b2ff7d633882f5e40147024f9824bd652eb69bf85b9f992a09ff47fb')
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
