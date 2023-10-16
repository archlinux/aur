# Maintainer: kmz <valesail7@gmail.com>
pkgname=ttf-monaco-nerd-font-git
pkgver=r23.a65e20d

pkgrel=1
pkgdesc='Monaco font patched with ryanoasis’s nerd patcher'
arch=('any')
url='https://github.com/Karmenzind/monaco-nerd-fonts'
license=('custom:Apple')
depends=()
makedepends=()
source=('COPYRIGHT' 'monaco-git::git+https://github.com/Karmenzind/monaco-nerd-fonts')
sha256sums=('75b450280572bdc340a5eac682ea7320776db78e378b5f0bd414a9f3538ee654' 'SKIP')

pkgver() {
  cd "${srcdir}/monaco-git"
  ( set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

package() {
    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
    install -d "${pkgdir}/usr/share/fonts/${pkgname}"
    install -Dm644 ${srcdir}/monaco-git/fonts/*.ttf "${pkgdir}/usr/share/fonts/${pkgname}"
    install -Dm644 "${srcdir}/COPYRIGHT" "${pkgdir}/usr/share/licenses/${pkgname}"
}                           
