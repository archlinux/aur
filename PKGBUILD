# Maintainer: Matthias gatto <matthias.gatto@outscale.com>
# Reference: PKGBUILD(5)

_pkgbase=oapi-cli
pkgname=oapi-cli-git
pkgrel=1
pkgdesc='New Outscale CLI'
pkgver=nightly.linux.r0.gc6a9503

arch=('any')
url="https://github.com/outscale/$_pkgbase"
license=(BSD)

makedepends=(git)
depends=(curl)

source=("git+$url.git#branch=master")
sha256sums=("SKIP")

pkgver() {
  cd "$_pkgbase"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$_pkgbase"
	make
}

package() {
  cd "$_pkgbase"
	install -Dm 644 "${srcdir}/oapi-cli/oapi-cli-completion.bash" "$pkgdir/usr/share/bash-completion/completions/oapi-cli"
	install -Dm 775 "${srcdir}/oapi-cli/oapi-cli" "$pkgdir/usr/bin/oapi-cli"
	install -Dm 644 "${srcdir}/oapi-cli/LICENSE" "$pkgdir/usr/share/licenses/oapi-cli/LICENSE"
}
