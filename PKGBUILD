# Maintainer: NOGISAKA Sadata <ngsksdt@gmail.com>
# Contributor: Kohei Suzuki <eagletmt@gmail.com>

pkgname=ghq
pkgver=1.5.0
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

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -Dm 755 ghq "$pkgdir/usr/bin/ghq"
  install -Dm 644 misc/bash/_ghq "$pkgdir/usr/share/bash-completion/completions/ghq"
  install -Dm 644 misc/zsh/_ghq "$pkgdir/usr/share/zsh/site-functions/_ghq"
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/ghq/LICENSE"
}

# vim: set et sw=2 sts=2:

sha512sums=('b626b86bbad033252902c2f6978d767e33d51e5f5643c39daea930b65b253824ff9b777688d36bc178117bcbe40de6d2d9f3322f38ed1d195d2eacf5e15ec625')
