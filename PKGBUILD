# Maintainer: Clever Cloud <ci@clever-cloud.com>

pkgname=clever-tools-bin
pkgver=5.0.0
pkgrel=1
pkgdesc="Command Line Interface for Clever Cloud. (standalone binary)"
arch=('x86_64')
url="https://github.com/CleverCloud/clever-tools"
license=('Apache-2.0')
# The binary embeds Node.js but is still dynamically linked against the C and C++ runtimes
depends=('glibc' 'gcc-libs')
provides=('clever-tools')
conflicts=('clever-tools')

# Prebuilt binary: stripping it breaks it, and there are no debug symbols to extract
options=(!strip !debug)

source=("clever-tools-5.0.0_linux.tar.gz::https://clever-tools.clever-cloud.com/releases/5.0.0/clever-tools-5.0.0_linux.tar.gz")
sha256sums=('239987932a000470736f4c55e5043650623fb89b8dd8a4b7bfde95974503363e')

package() {
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/bash-completion/completions"
  install -d "${pkgdir}/usr/share/zsh/site-functions"

  install "${srcdir}/clever-tools-5.0.0_linux/clever" "${pkgdir}/usr/bin/clever"

  "${srcdir}/clever-tools-5.0.0_linux/clever" --bash-autocomplete-script /usr/bin/clever > "${pkgdir}/usr/share/bash-completion/completions/clever"
  "${srcdir}/clever-tools-5.0.0_linux/clever" --zsh-autocomplete-script /usr/bin/clever > "${pkgdir}/usr/share/zsh/site-functions/_clever"
}