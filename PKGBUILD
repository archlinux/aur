# Maintainer: Ricardo Liang <ricardoliang at gmail dot com>

_name=dynamic-virtual-desktops
pkgname=kwin-scripts-${_name}-git
pkgver=r3.736b073
pkgrel=1
pkgdesc="KWin script that automatically adds/removes virtual desktops."
arch=('any')
url="https://github.com/rliang/kwin-${_name}"
license=('GPL')
depends=('kwin')
makedepends=('git')
optdepends=()
source=("${pkgname}::git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd ${pkgname}
  install -Dm644 contents/code/main.js "${pkgdir}/usr/share/kwin/scripts/${_name}/contents/code/main.js"
  install -Dm644 contents/config/main.xml "${pkgdir}/usr/share/kwin/scripts/${_name}/contents/config/main.xml"
  install -Dm644 contents/ui/config.ui "${pkgdir}/usr/share/kwin/scripts/${_name}/contents/ui/config.ui"
  install -Dm644 metadata.desktop "${pkgdir}/usr/share/kservices5/${_name}.desktop"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
