# Maintainer: Cametendo cameronmathis08@gmail.com
pkgname=arch-wallpapers-git
pkgver=1.0
pkgrel=1
pkgdesc="A collection of wallpapers"
arch=('any')
url="https://github.com/cametendo/Arch-Wallpapers"
license=('custom')
depends=()
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${pkgname%-git}"

  # Create the target directory
  install -d "${pkgdir}/usr/share/backgrounds/arch-wallpapers"

  # Copy all images and remove things you don't want to install (like .git or test.txt)
  find . -type f \( -name "*.png" -o -name "*.jpg" -o -name "*.jpeg" \) -exec install -Dm644 "{}" "${pkgdir}/usr/share/backgrounds/arch-wallpapers/" \;
}
