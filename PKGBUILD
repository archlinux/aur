# Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>
pkgname=zellij
pkgver=0.5.1
pkgrel=1
pkgdesc="A terminal multiplexer."
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://www.github.com/zellij-org/zellij"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'binaryen')
provides=('zellij')
conflicts=('zellij-git')
source=("https://github.com/zellij-org/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('05ddb52ca72d38db239e89d5b6e9aef6bc8f9dda28ffb115448f26c216690d619cda7f7a9bab05ac6c8a66663c153525fa239950609313f9cb747bc4b241d29a')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo install --force cargo-make
  cargo make install ./zellij
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo make test
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p "${pkgdir}/usr/share/doc/zellij"
  install -Dm755 ./zellij "${pkgdir}/usr/bin/zellij"
  install -Dm644 GOVERNANCE.md "${pkgdir}/usr/share/doc/zellij/GOVERNANCE.md"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/zellij/README.md"
  install -Dm644 assets/completions/zellij.bash "${pkgdir}/usr/share/bash-completion/completions/zellij.bash"
  install -Dm644 assets/completions/zellij.fish "${pkgdir}/usr/share/fish/completions/zellij.fish"
  install -Dm644 assets/completions/_zellij "${pkgdir}/usr/share/zsh/site-functions/_zellij"
}
