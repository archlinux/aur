# Maintainer: witt <1989161762 at qq dot com>
pkgname=ttf-ptcode-git
pkgver=r4.0a3769a
pkgrel=1
pkgdesc='Ligatures font for PT Mono .'
arch=('any')
url='https://github.com/liangjingkanji/PTCode'
license=('OFL')
conflicts=("${pkgname%-git}" "ptcode")
provides=("${pkgname%-git}" "ptcode")
makedepends=('git')
source=("${pkgname%-git}::git+${url}.git")
sha256sums=('SKIP')
pkgver() {
  cd "${pkgname%-git}"
  ( set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

package() {
    install -Dm644 "${srcdir}/${pkgname%-git}/font/"*.ttf -t "${pkgdir}/usr/share/fonts/PTCode"
    install -Dm644 "${srcdir}/${pkgname%-git}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}"
}                           
