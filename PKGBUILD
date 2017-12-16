pkgname='lout-dejavu-git'
pkgdesc="AFM files and koi8-r mapping for DejaVu TrueType fonts(for Lout)"
pkgrel=1
pkgver=r2.b40e7e2
arch=('any')
license=('GPL3')
depends=('lout' 'ttf-dejavu')
url="https://github.com/i-kuzmin/lout-dejavu"
source=("${pkgname}::git+${url}")
provides=(lout-dejavu)
sha256sums=('SKIP')

pkgver () {
  cd "$pkgname"
    (
        set -o pipefail
        git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' || \
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

package () {
    install -d "${pkgdir}/usr/lout"
    cp -r -t "${pkgdir}/usr/lout"  "${pkgname}/"{data,font,include,maps}
}

# vim:set ts=2 sw=2 et:
