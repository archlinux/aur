# Maintainer: Josh VanderLinden <arch@cloudlery.com>
pkgname=('ttf-go-mono-git' 'ttf-go-sans-git')
pkgver=r192.b7f8df6
pkgrel=1
pkgdesc="The Go font family"
arch=('any')
url="https://go.googlesource.com/image"
license=('BSD')
depends=('fontconfig')
makedepends=('git')
install=ttf-go.install
source=(repo::git+${url})
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/repo"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

core_package() {
  install -Dm644 "${srcdir}/repo/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -d "${pkgdir}/usr/share/fonts/TTF"
}

package_ttf-go-mono-git() {
  core_package

  for fn in $(ls "${srcdir}/repo/font/gofont/ttfs/"*.ttf | grep -i mono); do
    install -Dm644 "${fn}" "${pkgdir}/usr/share/fonts/TTF/$(basename "${fn}")"
  done
}

package_ttf-go-sans-git() {
  core_package

  for fn in $(ls "${srcdir}/repo/font/gofont/ttfs/"*.ttf | grep -vi mono); do
    install -Dm644 "${fn}" "${pkgdir}/usr/share/fonts/TTF/$(basename "${fn}")"
  done
}
