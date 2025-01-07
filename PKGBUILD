# Maintainer: mochaaP <aur@mochaa.ws>

_pkgname=iansui
pkgname=ttf-${_pkgname}-git
pkgver=v1.003.g41190e8
pkgrel=1
pkgdesc="An open source Chinese font derived from Klee One (Fontworks)."
arch=('any')
license=('OFL')
url="https://github.com/ButTaiwan/${_pkgname}"
source=("git+${url}.git")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/${_pkgname}"
  make build
}

package() {
  cd "${srcdir}/${_pkgname}"

  install -Dm644 -t "${pkgdir}/usr/share/fonts/TTF/" fonts/ttf/*.ttf

  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname%-git}/README.md"
  install -Dm644 ChangeLog.md "${pkgdir}/usr/share/doc/${pkgname%-git}/CHANGELOG.md"
  install -Dm644 OFL.txt "${pkgdir}/usr/share/licenses/${pkgname%-git}/OFL.txt"
}

pkgver() {
  cd "$srcdir/${_pkgname}"
  printf "%s.g%s" "$(grep -m 1 -Eo 'v[0-9].[0-9]{3}' ChangeLog.md)" "$(git rev-parse HEAD | head -c7)"
}
