# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: T.J. Townsend <blakkheim@archlinux.org>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>

pkgname=exploitdb-papers-git
pkgver=2022.11.22.r0.gd79ce5a
pkgrel=2
pkgdesc="Offensive Security's Exploit Database Archive"
arch=('any')
provides=('exploitdb-papers')
conflicts=('exploitdb-papers')
replaces=('exploitdb-papers')
url="https://www.exploit-db.com/"
license=('GPL')
depends=('exploitdb')
makedepends=('git' 'sed' 'coreutils' 'findutils')
options=('!strip')
source=("${pkgname%-git}::git+https://gitlab.com/exploit-database/${pkgname%-git}.git")
sha512sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname%-git}"
    printf "%s" "$(git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')"
}

package() {
    # Placing files into package destination
    cd "${srcdir}/${pkgname%-git}/"
    find {docs/,papers/,files_papers.csv} -type f -exec install -Dm644 {} "${pkgdir}/usr/share/${pkgname%-git}/{}" \;

    # Installing license
    install -Dm644 "${srcdir}/${pkgname%-git}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
}

# vim: ts=4 sw=4 et:
