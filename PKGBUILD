# Maintainer: Your Name <you@example.com>
pkgname=lsl
pkgver=1.0.0
pkgrel=1
_commit='a5f4f4ee5989ce188c44094c526c5b454ae01f7a'
pkgdesc='linux subsystem for linux'
arch=('any')
url='https://gitlab.com/sulincix/debian-subsystem/'
license=('MIT')
depends=('glibc')
makedepends=('git' 'pam' 'gcc' 'debootstrap')
source=("${pkgname}-${pkgver}::https://gitlab.com/sulincix/debian-subsystem/-/archive/a5f4f4ee5989ce188c44094c526c5b454ae01f7a/debian-subsystem-a5f4f4ee5989ce188c44094c526c5b454ae01f7a.zip")
md5sums=('SKIP')

build() {
    sed -i "s|/bin/|/usr/bin/|g" "debian-subsystem-${_commit}"/Makefile
    make -C "debian-subsystem-${_commit}" build
}

package() {
    make -C "debian-subsystem-${_commit}" DESTDIR="${pkgdir}" \
        LIBDIR=/usr/lib PAMDIR=/usr/lib/security install   
}
