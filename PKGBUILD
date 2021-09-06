# Maintainer: Arturo Penen <apenen@gmail.com>
# Contributor: David Birks <david@birks.dev>
# Contributor: Jacob Mason <jacob@jacobmason.net>

pkgname=jx2
pkgver=2.1.157
pkgrel=1
pkgdesc='Command line tool for working with Jenkins X v2'
arch=('x86_64')
url='https://github.com/jenkins-x/jx'
license=('Apache')
makedepends=('go')
source=("jx-$pkgver.tar.gz::https://github.com/jenkins-x/jx/archive/v$pkgver.tar.gz")
sha256sums=('b82ddb3fb4549c3da530e862b88803583b44b1941127ac9e0d9101e42a994b22')

build() {
  cd jx-$pkgver
  export VERSION=$pkgver
  make build
}

package() {
  install -Dm 755 "${srcdir}/jx-$pkgver/build/jx" "${pkgdir}/usr/bin/jx2"

  # Populate bash and zsh completions
  install -dm 755 "${pkgdir}/usr/share/bash-completion/completions"
  install -dm 755 "${pkgdir}/usr/share/zsh/site-functions"
  "${pkgdir}/usr/bin/jx2" completion bash > "${pkgdir}/usr/share/bash-completion/completions/jx2"
  "${pkgdir}/usr/bin/jx2" completion zsh >  "${pkgdir}/usr/share/zsh/site-functions/_jx2"
}
