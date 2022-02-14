# Maintainer: x70b1

pkgname=pam_exec-gpg
pkgver=r3.6d52187
pkgrel=1
pkgdesc="Unlock GnuPG keys keys on login using PAM."
arch=(any)
url="https://github.com/x70b1/pam_exec-gpg"
license=("The Unlicense")
makedepends=("git")
depends=("pam")
source=("${pkgname}::git+${url}.git#commit=$(echo ${pkgver} | cut -d '.' -f 2)")
noextract=()
sha256sums=('SKIP')

pkgver() {
    cd ${pkgname}
    set -o pipefail
    git describe --long 2> /dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd ${pkgname}
    install -Dm755 pam_exec-gpg "${pkgdir}"/usr/bin/pam_exec-gpg
}
