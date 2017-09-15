# Maintainer: sdvcrx <memory.silentvoyage at gmail dot com>
# Contributor: Bastien "neitsab" Traverse <firstname at lastname dot email>
# Contributor: masterme120
# Contributor: runical
# Contributor: oozyslug <oozyslug at gmail dot com>
# Submitter: Bastien Traverse <firstname at lastname dot email>

pkgname=hugo-bin
pkgver=0.27.1
pkgrel=1
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
source_arm=("https://github.com/spf13/hugo/releases/download/v${pkgver}/${pkgname/-bin}_${pkgver}_linux_ARM.tar.gz")
sha256sums_x86_64=('0e6cb63e6aca10277b96023c4fed97ac3a3e922d12f073b8a80630946fe289e7')
sha256sums_i686=('fde90ad3e7a0cc30f65ed3a064881478c3935aee7997e000110fdb16f4043966')
sha256sums_arm=('aa64875ae45f37ec6d4f54feccf59659dbfe63c271986cc864fa6ec11b794599')

case "$CARCH" in
  arm*) _pkgarch="arm"
	;;
  i686) _pkgarch="386"
	;;
  x86_64) _pkgarch="amd64"
	;;
esac

package() {
  install -Dm755 "${srcdir}/${pkgname/-bin}" "${pkgdir}/usr/bin/${pkgname/-bin}"
  install -Dm644 "${srcdir}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname/-bin}/LICENSE"

  # Generate shell autocompletion script
  mkdir -p "${pkgdir}/usr/share/bash-completion/completions/"
  "${srcdir}/${pkgname/-bin}" gen autocomplete --completionfile="${pkgdir}/usr/share/bash-completion/completions/${pkgname/-bin}"

  # Generate man pages
  mkdir -p "${pkgdir}/usr/share/man/man1/"
  "${srcdir}/${pkgname/-bin}" gen man --dir="${pkgdir}/usr/share/man/man1/"
}
