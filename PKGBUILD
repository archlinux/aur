# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>

pkgname=wifiphisher-extra-phishing-pages-git
_pkgname=extra-phishing-pages
pkgver=r47.177c781
pkgrel=3
pkgdesc='Community-built scenarios for Wifiphisher'
arch=('any')
url='https://github.com/wifiphisher/extra-phishing-pages'
license=('GPL3')
depends=('wifiphisher')
makedepends=('git')
source=("git+https://github.com/wifiphisher/${_pkgname}.git")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${_pkgname}"
  mkdir -p "${pkgdir}/usr/lib/python3.8/site-packages/wifiphisher/data/phishing-pages/"
  find . -maxdepth 1 ! -path . ! -path ./.git -type d -exec\
    cp -r '{}' "${pkgdir}/usr/lib/python3.8/site-packages/wifiphisher/data/phishing-pages/" \;
  install -Dm 644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
