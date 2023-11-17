# Maintainer: xiota / aur.chaotic.cx

_gitname="literata"
pkgbase="ttf-${_gitname:?}-git"
pkgname=(
  ttf-literata-git
  ttf-literata-opticals-git
  ttf-literata-variable-git
)
pkgver=3.103.r0.g0c2761b7
pkgrel=2
pkgdesc="Contemporary serif typeface family for long-form reading"
url="https://github.com/googlefonts/literata"
license=('OFL')
arch=('any')

makedepends=('git')

_pkgsrc="$_gitname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

_extended_conflicts() {
  conflicts=(
    otf-literata
    ttf-literata
    ttf-literata-opticals
    ttf-literata-variable
    ttf-literata-webfonts 
    ttf-literata-webfonts-opticals 
  )
}

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --exclude='*[a-zA-Z][a-zA-Z]*' 2>/dev/null \
    | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

package_ttf-literata-git() {
  #provides=("${pkgname%-git}=${pkgver%%.r*}")
  conflicts=("${pkgname%-git}")
  _extended_conflicts

  install -Dm644 "${_pkgsrc:?}/fonts/ttf"/Literata-*.ttf -t "$pkgdir/usr/share/fonts/${pkgname%-git}/"
  install -Dm644 "${_pkgsrc:?}/OFL.txt" -t "$pkgdir/usr/share/licenses/$pkgname/"
}

package_ttf-literata-opticals-git() {
  depends=("ttf-literata-git")
  #provides=("${pkgname%-git}=${pkgver%%.r*}")
  conflicts=("${pkgname%-git}")
  _extended_conflicts

  install -Dm644 "${_pkgsrc:?}/fonts/ttf"/Literata[0-9]*.ttf -t "$pkgdir/usr/share/fonts/${pkgname%-git}/"
  install -Dm644 "${_pkgsrc:?}/OFL.txt" -t "$pkgdir/usr/share/licenses/$pkgname/"
}

package_ttf-literata-variable-git() {
  #provides=("${pkgname%-git}=${pkgver%%.r*}")
  conflicts=("${pkgname%-git}")
  _extended_conflicts

  install -Dm644 "${_pkgsrc:?}/fonts/variable"/Literata*.ttf -t "$pkgdir/usr/share/fonts/${pkgname%-git}/"
  install -Dm644 "${_pkgsrc:?}/OFL.txt" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
