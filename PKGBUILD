# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

pkgname=singularity-ce
pkgver=3.10.4
pkgrel=1
pkgdesc='An open source container platform designed to be simple, fast, and secure.'
arch=(x86_64)
url='https://github.com/sylabs/singularity'
license=('GPL2')
depends=('cryptsetup' 'go>=1.17' 'libnvidia-container-tools' 'squashfs-tools')
makedepends=('git')
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('ee65236b19c5c2b356bdb06875a5438be311373ba83daad17f9f89484acda8662444625481061765aa06269e862f7ddc6aa4e03461b06c2028e271325a602d32')

build() {
    cd $pkgname-$pkgver
    # libexecdir is recommended here https://wiki.archlinux.org/title/Arch_package_guidelines#Package_etiquette
    ./mconfig \
        --prefix="/usr" \
        --libexecdir="/usr/lib/$pkgname"

    cd builddir
    make
}

package() {
    cd $pkgname-$pkgver/builddir
    make DESTDIR="$pkgdir/" install
}
