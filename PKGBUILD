# $Id$
# Maintainer: Bastien Traverse <firstname at lastname dot email>
# Contributor: masterme120
# Contributor: runical
# Contributor: oozyslug <oozyslug at gmail dot com>
# Submitter: Bastien Traverse <firstname at lastname dot email>

pkgname=hugo-bin
pkgver=0.17
pkgrel=2
pkgdesc="A Fast and Flexible Static Site Generator built in Go - Precompiled binary from official repository"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
url="https://gohugo.io/"
license=('Apache')
optdepends=('pygmentize: source code highlighting'
            'asciidoc: AsciiDoc support'
            'asciidoctor: AsciiDoc support (Ruby implementation)'
            'python-docutils: reStructuredText support')
provides=('hugo')
conflicts=('hugo')

source_x86_64=("https://github.com/spf13/hugo/releases/download/v${pkgver}/${pkgname/-bin}_${pkgver}_Linux-64bit.tar.gz")
source_i686=("https://github.com/spf13/hugo/releases/download/v${pkgver}/${pkgname/-bin}_${pkgver}_Linux-32bit.tar.gz")
source_arm=("https://github.com/spf13/hugo/releases/download/v${pkgver}/${pkgname/-bin}_${pkgver}_linux_arm.tar.gz")
md5sums_x86_64=('6a74626b64434a5ee9fc5ec4fbf22ce6')
md5sums_i686=('7b2a37c458dd4af6eb1ed2672969a26b')
md5sums_arm=('c34d30cc8302311c0c315a3dd2a0b319')

case "$CARCH" in
  arm*) _pkgarch="arm"
	;;
  i686) _pkgarch="386"
	;;
  x86_64) _pkgarch="amd64"
	;;
esac

package() {
  install -Dm755 "${srcdir}/${pkgname/-bin}_${pkgver}_linux_${_pkgarch}/${pkgname/-bin}_${pkgver}_linux_${_pkgarch}" "${pkgdir}/usr/bin/${pkgname/-bin}"
  install -Dm644 "${srcdir}/${pkgname/-bin}_${pkgver}_linux_${_pkgarch}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname/-bin}/LICENSE"

  # Generate shell autocompletion script
  mkdir -p "${pkgdir}/usr/share/bash-completion/completions/"
  "${srcdir}/${pkgname/-bin}_${pkgver}_linux_${_pkgarch}/${pkgname/-bin}_${pkgver}_linux_${_pkgarch}" gen autocomplete --completionfile="${pkgdir}/usr/share/bash-completion/completions/${pkgname/-bin}"

  # Generate man pages
  mkdir -p "${pkgdir}/usr/share/man/man1/"
  "${srcdir}/${pkgname/-bin}_${pkgver}_linux_${_pkgarch}/${pkgname/-bin}_${pkgver}_linux_${_pkgarch}" gen man --dir="${pkgdir}/usr/share/man/man1/"
}
