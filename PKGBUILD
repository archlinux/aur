# Maintainer: hekel <hekel(at)vivaldi(dot)net>

pkgname=kwin-effects-burn-my-windows-git
_pkgname=Burn-My-Windows-kde
pkgver=r635.caec83a
pkgrel=1
pkgdesc="Disintegrate your windows with style."
arch=('any')
_url="https://github.com/Schneegans/Burn-My-Windows"
url="$_url/tree/feature/kde"
license=('GPL3')
depends=('kwin')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$_pkgname::git+$_url.git#branch=feature/kde")
sha256sums=('SKIP')

pkgver() {
  cd ${srcdir}/${_pkgname}
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "${srcdir}/${_pkgname}/kwin"
  sh build.sh
}

package() {
  mkdir -p "${pkgdir}/usr/share/kwin/effects/"
  cp -r "${srcdir}/${_pkgname}/kwin/_build/." "${pkgdir}/usr/share/kwin/effects/"
}
