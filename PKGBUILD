# Maintainer: Max Harmathy <harmathy@secure.mailbox.org>
# Contributor: Arturo Penen <apenen@gmail.com>

pkgname=ghorg
pkgver=1.9.12
pkgrel=1
pkgdesc='allows you to quickly clone all of an orgs, or users repos into a single directory.'
arch=('x86_64')
url='https://github.com/gabrie30/ghorg'
license=('Apache-2.0')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8052b122ab18570714009a0dd0caf4ac2b437f3f7ab753b2e080a5ce21afddc2')

build() {
  cd $pkgname-$pkgver
  go build
}

package() {
  install -Dm 755 "${pkgname}-${pkgver}/ghorg" "${pkgdir}/usr/bin/ghorg"

  # Populate bash and zsh completions
  install -dm 755 "${pkgdir}/usr/share/bash-completion/completions"
  install -dm 755 "${pkgdir}/usr/share/zsh/site-functions"
  "${pkgdir}/usr/bin/ghorg" completion bash > "${pkgdir}/usr/share/bash-completion/completions/ghorg"
  "${pkgdir}/usr/bin/ghorg" completion zsh >  "${pkgdir}/usr/share/zsh/site-functions/_ghorg"
}
