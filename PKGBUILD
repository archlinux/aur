# Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>
pkgname=zellij
pkgver=0.5.0.beta
_pkgver=0.5.0-beta
pkgrel=1
pkgdesc="A terminal multiplexer."
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://www.github.com/zellij-org/zellij"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'binaryen')
provides=('zellij')
conflicts=('zellij-git')
source=("https://github.com/zellij-org/${pkgname}/archive/refs/tags/v${_pkgver}.tar.gz")
sha512sums=('335b78dd9f78bbf657bdb833f6ad9fa53e266758cd65239b03eedb29cb1f2be77fbf5b6c27c847551ce099703c187d73fe23892d29ec618c7585ee3864d5ab3f')

build() {
  cd "${srcdir}/${pkgname}-${_pkgver}"
  cargo install --force cargo-make
  cargo make install ./zellij
}

check() {
  cd "${srcdir}/${pkgname}-${_pkgver}"
  cargo make test
}

package() {
  cd "${srcdir}/${pkgname}-${_pkgver}"
  mkdir -p "${pkgdir}/usr/share/doc/zellij"
  install -Dm755 ./zellij "${pkgdir}/usr/bin/zellij"
  install -Dm644 GOVERNANCE.md "${pkgdir}/usr/share/doc/zellij/GOVERNANCE.md"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/zellij/README.md"
  install -Dm644 assets/completions/zellij.bash "${pkgdir}/usr/share/bash-completion/completions/zellij.bash"
  install -Dm644 assets/completions/zellij.fish "${pkgdir}/usr/share/fish/completions/zellij.fish"
  install -Dm644 assets/completions/_zellij "${pkgdir}/usr/share/zsh/site-functions/_zellij"
}
