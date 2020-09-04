# Maintainer: Danilo Bargen <aur at dbrgn dot ch>
# Contributor: Maxim Andersson <thesilentboatman@gmail.com>
pkgname=tealdeer
_binname=tldr
pkgver=1.4.1
pkgrel=2
pkgdesc="A fast tldr client in Rust."
arch=('x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/dbrgn/tealdeer"
license=('MIT' 'Apache')
depends=('openssl')
makedepends=('rust' 'cargo')
provides=('tldr')
conflicts=('tldr' 'nodejs-tldr' 'nodejs-tldr-git' 'tldr-cpp-client' 'tldr-git' 'tldr-python-client' 'tldr++')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/dbrgn/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('eaf42fe17be751985cbf46c170ef623fcbd36028c88c2e70823492a9335a4a8e')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo build --release
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Install binary
  install -Dm 755 target/release/${_binname} -t "${pkgdir}/usr/bin"

  # Install shell completions
  install -D -o root -g root -m 644 bash_tealdeer "${pkgdir}/usr/share/bash-completion/completions/${_binname}"
  install -D -o root -g root -m 644 fish_tealdeer "${pkgdir}/usr/share/fish/completions/${_binname}.fish"
  install -D -o root -g root -m 644 zsh_tealdeer "${pkgdir}/usr/share/zsh/site-functions/_${_binname}"

  # Install MIT license
  install -Dm 644 LICENSE-MIT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
}

# vim:set ts=2 sw=2 et:
