# Maintainer: witt <1989161762 at qq dot com>
pkgname=otf-plex-mono-git
pkgver=r2.9310bc9
pkgrel=1
pkgdesc='Ligatures for IBM Plex Mono .'
arch=('any')
url='https://github.com/liangjingkanji/PlexMono'
license=('Apache-2.0')
conflicts=("${pkgname%-git}"
  "woff2-ibm-plex-git" 
  "ttf-ibm-plex-git"
  "otf-ibm-plex-git"
  "ttf-blex-nerd-font-git"
  "texlive-fonts-plex"
)
provides=("${pkgname%-git}" "plex" "plex-mono" "Plex-fonts")
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
    install -Dm644 "${srcdir}/${pkgname%-git}/font/"*.otf -t "${pkgdir}/usr/share/fonts/plex/plex-mono"
    install -Dm644 "${srcdir}/${pkgname%-git}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}"
}                           
