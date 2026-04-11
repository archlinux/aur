# Maintainer: Syner <your-email-here>
pkgname=synfetch-git
pkgver=r1.abcdef
pkgrel=1
pkgdesc="A fast and customizable system info tool with a synthwave theme"
arch=('any')
url="https://github.com/SXSLVT/synfetch"
license=('GPL3')
depends=('bash')
makedepends=('git')
optdepends=(
  'nvidia-utils: Better NVIDIA GPU usage monitoring'
  'pciutils: Better for accurate GPU detection'
)
provides=('synfetch')
conflicts=('synfetch')
source=("${pkgname}::git+https://github.com/SXSLVT/synfetch.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${pkgname}"
  
  # Install the main script to /usr/bin (NOT /usr/local/bin)
  install -Dm755 synfetch "${pkgdir}/usr/bin/synfetch"
  
  # Install license
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
