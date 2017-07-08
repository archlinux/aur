# Maintainer: banbanchs <memory.silentvoyage at gmail dot com>
# Contributor: Bastien "neitsab" Traverse <firstname at lastname dot email>
# Contributor: masterme120
# Contributor: runical
# Contributor: oozyslug <oozyslug at gmail dot com>
# Submitter: Bastien Traverse <firstname at lastname dot email>

pkgname=hugo-bin
pkgver=0.25
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
sha256sums_x86_64=('443b6d2af0df8469a3c853acac03ddfb66ce05c642342edf3813f5c55e3b2f95')
sha256sums_i686=('5244225e72310620f556b56f12f66eaa0cf25dc3e4031576dba5cd583637c951')
sha256sums_arm=('d470a7c636af03d256878b0a21886c4ff66574a4b24786c7e5e3d7afea13c284')

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
