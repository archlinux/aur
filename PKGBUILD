# Maintainer: Danilo Bargen <aur at dbrgn dot ch>
# Contributor: Maxim Andersson <thesilentboatman@gmail.com>
pkgname=tealdeer
_binname=tldr
pkgver=1.2.0
pkgrel=1
pkgdesc="A fast tldr client in Rust."
arch=('any')
url="https://github.com/dbrgn/tealdeer"
license=('MIT' 'Apache')
makedepends=('rust' 'cargo')
provides=('tldr')
conflicts=('tldr' 'nodejs-tldr' 'nodejs-tldr-git' 'tldr-cpp-client' 'tldr-git' 'tldr-python-client')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/dbrgn/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('5cf286059b823501d05da445b9b7a609ec2da91d711d990df76397f79d800c52')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo build --release
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Install binary
  install -D target/release/${_binname} -t "${pkgdir}/usr/bin"

  # Install shell completions
  install -D -o root -g root -m 644 bash_tealdeer "${pkgdir}/usr/share/bash-completion/completions/${_binname}"
  install -D -o root -g root -m 644 fish_tealdeer "${pkgdir}/usr/share/fish/completions/${_binname}.fish"

  # Install MIT license
  install -Dm 644 LICENSE-MIT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
}

# vim:set ts=2 sw=2 et:
