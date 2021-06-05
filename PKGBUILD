# Maintainer: NOGISAKA Sadata <ngsksdt@gmail.com>
# Contributor: Kohei Suzuki <eagletmt@gmail.com>

pkgname=ghq
pkgver=1.2.1
pkgrel=1
pkgdesc="Remote repository management made easy"
arch=('i686' 'x86_64')
url="https://github.com/x-motemen/ghq"
license=('MIT')
makedepends=('go'  'git')     # Yes, you're right; no git-depended lines in the PKGBUILD but `make test` requires git...
optdepends=('zsh: ghq function for zsh')
conflicts=('ghq-bin')
source=("https://github.com/x-motemen/${pkgname}/archive/v${pkgver}.tar.gz")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export GOPATH="$srcdir/build"
  go get -t -d -v
  make build
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export GOPATH="$srcdir/build"
  make test
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -Dm 755 ghq "$pkgdir/usr/bin/ghq"
  install -Dm 644 misc/bash/_ghq "$pkgdir/usr/share/bash-completion/completions/_ghq"
  install -Dm 644 misc/zsh/_ghq "$pkgdir/usr/share/zsh/site-functions/_ghq"
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/ghq/LICENSE"
}

# vim: set et sw=2 sts=2:

sha512sums=('7df1cb669058ddeae088ba7a68a98b8bdcd892d67e4335e90c5fe67027894e74d7f14aea26d44d8ccedb11d3a9b5dc836fb36d0079046ca7d6bbb25c169b70f1')
