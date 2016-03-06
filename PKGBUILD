# Maintainer: Slithery <aur at slithery dot uk>

pkgname=mediterranean-gtk-themes-git
pkgver=v2.03.0.1.r30.g1c33164
pkgrel=2
pkgdesc="The Mediterranean family of GTK+2/3 themes"
arch=('any')
url="https://github.com/rbrito/mediterranean-gtk-themes"
license=('GPL3')
optdepends=('gtk-engines: For GTK2 support'
            'gtk-engine-murrine: for GTK2 support'
            'gtk3: for GTK3 support')
makedepends=('git')
source=("${pkgname}::git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package () {
  cd "${pkgname}"
  find Mediterranean*/ -type f -exec install -Dm644 "{}" "${pkgdir}/usr/share/themes/{}" \;
}
