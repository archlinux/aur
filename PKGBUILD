# Maintainer: Clever Cloud <ci@clever-cloud.com>

pkgname=clever-tools-bin
pkgver=5.5.0
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

source=("clever-tools-5.5.0_linux.tar.gz::https://clever-tools.clever-cloud.com/releases/5.5.0/clever-tools-5.5.0_linux.tar.gz")
sha256sums=('af4da73130e3692d0834b36bb89a19ef3043271a36bcc9bf46d66e61fbda3233')

package() {
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/bash-completion/completions"
  install -d "${pkgdir}/usr/share/zsh/site-functions"

  install "${srcdir}/clever-tools-5.5.0_linux/clever" "${pkgdir}/usr/bin/clever"

  "${srcdir}/clever-tools-5.5.0_linux/clever" --bash-autocomplete-script /usr/bin/clever > "${pkgdir}/usr/share/bash-completion/completions/clever"
  "${srcdir}/clever-tools-5.5.0_linux/clever" --zsh-autocomplete-script /usr/bin/clever > "${pkgdir}/usr/share/zsh/site-functions/_clever"
}