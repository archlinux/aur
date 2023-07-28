# Maintainer: x70b1

pkgname=pam_exec-gpg-git
pkgver=r8.aadfc63
pkgrel=3
pkgdesc="Unlock GnuPG keys keys on login using PAM."
arch=(any)
url="https://github.com/x70b1/pam_exec-gpg"
license=("The Unlicense")
makedepends=("git")
depends=("pam")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname}::git+${url}.git")
noextract=()
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    set -o pipefail
    git describe --long 2> /dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd ${pkgname}
    install -Dm755 pam_exec-gpg "${pkgdir}/usr/bin/${pkgname%-git}"
}
