# Maintainer: Matthias gatto <matthias.gatto@outscale.com>
# Reference: PKGBUILD(5)

pkgname=oapi-cli-git
pkgrel=1
pkgdesc='New Outscale CLI'
pkgver=nightly.linux.r0.gc6a9503

arch=('any')
url='https://github.com/outscale/oapi-cli'
license=(BSD)

pkgver() {
  cd "${srcdir}/oapi-cli"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

makedepends=(git)
depends=(curl)

source=("git+https://github.com/outscale/oapi-cli.git")
sha256sums=("SKIP")

build() {
	cd "${srcdir}/oapi-cli"
	make
}

package() {
	cd "${srcdir}/oapi-cli"
	install -Dm 644 "${srcdir}/oapi-cli/oapi-cli-completion.bash" "$pkgdir/usr/share/bash-completion/completions/oapi-cli"
	install -Dm 775 "${srcdir}/oapi-cli/oapi-cli" "$pkgdir/usr/bin/oapi-cli"
	install -Dm 644 "${srcdir}/oapi-cli/LICENSE" "$pkgdir/usr/share/licenses/oapi-cli/LICENSE"
}
