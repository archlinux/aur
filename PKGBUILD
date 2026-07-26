# Maintainer: Yakov Till <yakov.till@gmail.com>

# Upstream ships no license file and states no license terms anywhere, so the
# terms are genuinely unknown rather than merely non-SPDX; 'custom' would imply
# a license file that does not exist.

pkgname=optmem-git
pkgver=r37.d618a3a
pkgrel=1
pkgdesc="Permanent memory for AI agents: an append-only memory store and a 426-token prompt"
arch=('any')
url="https://github.com/VictorTaelin/OptMem"
license=('unknown')
depends=('python')
makedepends=('git')
provides=('optmem')
conflicts=('optmem')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

check() {
    cd "${srcdir}/${pkgname}"
    python test.py
}

package() {
    cd "${srcdir}/${pkgname}"
    install -Dm755 memo "${pkgdir}/usr/bin/memo"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname%-git}/README.md"
}
