# Maintainer: Clever Cloud <ci@clever-cloud.com>

pkgname=clever-tools-bin
pkgver=5.0.1
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

source=("clever-tools-5.0.1_linux.tar.gz::https://clever-tools.clever-cloud.com/releases/5.0.1/clever-tools-5.0.1_linux.tar.gz")
sha256sums=('31a9c59d5c2706762061eae359b17c7751c86c32142ee598a7e41a451db3531e')

package() {
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/bash-completion/completions"
  install -d "${pkgdir}/usr/share/zsh/site-functions"

  install "${srcdir}/clever-tools-5.0.1_linux/clever" "${pkgdir}/usr/bin/clever"

  "${srcdir}/clever-tools-5.0.1_linux/clever" --bash-autocomplete-script /usr/bin/clever > "${pkgdir}/usr/share/bash-completion/completions/clever"
  "${srcdir}/clever-tools-5.0.1_linux/clever" --zsh-autocomplete-script /usr/bin/clever > "${pkgdir}/usr/share/zsh/site-functions/_clever"
}