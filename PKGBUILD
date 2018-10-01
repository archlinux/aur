# Maintainer: Fredy García <frealgagu at gmail dot com>

pkgname=java-design-patterns-git
pkgver=1.20.0.r0.26d6d96f
pkgrel=1
pkgdesc="Design patterns implemented in Java"
arch=("any")
url="http://${pkgname%-git}.com/"
license=("MIT")
optdepends=("java-environment" "maven")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install="${pkgname%-git}.install"
source=("${pkgname%-git}::git+https://github.com/iluwatar/${pkgname%-git}")
sha256sums=("SKIP")

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  (
    set -o pipefail
    git describe --long --tags 2> /dev/null | sed "s/^[a-Z\.\-]*//;s/\([^-]*-\)g/r\1/;s/-/./g" || 
    printf "r%s.%s\n" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" 
  )
}

package() {
  echo "Installing custom license /usr/share/licenses/${pkgname}/"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname%-git}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/"
  
  echo "Installing ${pkgname%-git} into /opt"
  install -d "${pkgdir}/opt"
  cp -r "${srcdir}/${pkgname%-git}" "${pkgdir}/opt/${pkgname%-git}"

  echo "Removing git from package"
  rm -rf "${pkgdir}/opt/${pkgname%-git}/.git"
}
