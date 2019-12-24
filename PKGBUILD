# Maintainer: Robert Kubosz <kubosz.robert@gmail.com>

pkgname=zfscrypt-git
pkgver=9662d6d
pkgrel=1
pkgdesc="Combine ZFS and PAM to encrypt home directories on Linux"
arch=("any")
url="https://github.com/BenKerry/zfscrypt"
license=("MIT")
depends=("pam" "zfs-utils")
makedepends=("git" "make" "gcc")
source=("git+$url")
md5sums=("SKIP")

_pkgname=zfscrypt

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --always
}

build() {
    cd "$srcdir/$_pkgname"
    make
}

package() {
    cd "$srcdir/$_pkgname"
    install -Dm 755 "$srcdir/$_pkgname/build/pam_zfscrypt.so" "$pkgdir/usr/lib/security/pam_zfscrypt.so"
    install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

