# Maintainer: robertfoster

pkgname=distrobox-git
pkgver=1.5.0.r952.67c5cb1
pkgrel=1
pkgdesc="Use any linux distribution inside your terminal."
arch=('any')
url="https://github.com/89luca89/distrobox"
license=('GPL3')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
makedepends=('git')
optdepends=(
  'docker: enable docker usage'
  'podman: enable podman usage'
)
source=("${pkgname%-git}::git+${url}")

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "%s.r%s.%s" "$(git describe --tags --abbrev=0)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${pkgname%-git}"
  ./install -P "${pkgdir}/usr"

  find docs -name "*.md" \
    -exec install -Dm 644 -t "${pkgdir}/usr/share/doc/${pkgname%-git}" {} +
}

sha256sums=('SKIP')
