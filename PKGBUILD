# Maintainer: Arturo Penen <apenen@gmail.com>
# Contributor: David Birks <david@birks.dev>
# Contributor: Jacob Mason <jacob@jacobmason.net>

pkgname=jx2
pkgver=2.1.155
pkgrel=3
pkgdesc='Command line tool for working with Jenkins X v2'
arch=('x86_64')
url='https://github.com/jenkins-x/jx'
license=('Apache')
makedepends=('go')
source=("jx-$pkgver.tar.gz::https://github.com/jenkins-x/jx/archive/v$pkgver.tar.gz")
sha256sums=('723c6dbd27d093afea2b51a19ff22779e670a22107cf96d94f5da1ca6cdba73f')

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
