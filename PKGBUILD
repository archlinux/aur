# Maintainer: Lance G. <gero3977 at gmail dot com>
# Contributor: Antoni Boucher <bouanto at zoho dot com>

pkgname='mobile-config-firefox-git'
pkgver=2.1.0+1+g92e1a26
pkgrel=1
pkgdesc="Mobile and privacy friendly configuration for Firefox"
url="https://gitlab.com/postmarketOS/mobile-config-firefox"
license=('GPL')
arch=('x86_64' 'i686' 'pentium4' 'arm' 'armv6h' 'armv7h' 'aarch64')
depends=('firefox')
source=("$pkgname::git+https://gitlab.com/postmarketOS/mobile-config-firefox"
        "0001-Update-links-for-ArchLinux.patch")
sha256sums=("SKIP"
    "be6c30de864c812edc897c9d7bf4896f646fa73268d945646032eb1a9a8926f0")

prepare() {
    cd $pkgname
    patch --forward --strip=1 --input="${srcdir}/0001-Update-links-for-ArchLinux.patch"
}

pkgver() {
    cd $pkgname
    git describe --long --tags | sed 's/-/+/g; s/^v//'
}

build() {
    cd $pkgname
    make DISTRO=ArchLinux
}

package() {
    cd $pkgname
    make DESTDIR=$pkgdir install
}
