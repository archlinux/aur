# Maintainer: NOGISAKA Sadata <ngsksdt@gmail.com>
# Contributor: Kohei Suzuki <eagletmt@gmail.com>

pkgname=ghq
pkgver=1.1.2
pkgrel=1
pkgdesc="Remote repository management made easy"
arch=('i686' 'x86_64')
url="https://github.com/x-motemen/ghq"
license=('MIT')
makedepends=('go' 'git')
optdepends=('zsh: ghq function for zsh')
source=("git+https://github.com/x-motemen/${pkgname}.git")

prepare() {
  cd "${srcdir}/${pkgname}"
  git checkout "v${pkgver}"
}

build() {
  cd "${srcdir}/${pkgname}"
  export GOPATH="$srcdir/build"
  go get -t -d -v
  make build
}

check() {
  cd "${srcdir}/${pkgname}"
  export GOPATH="$srcdir/build"
  make test
}

package() {
  cd "${srcdir}/${pkgname}"

  install -Dm 755 ghq "$pkgdir/usr/bin/ghq"
  install -Dm 644 misc/bash/_ghq "$pkgdir/usr/share/bash-completion/completions/_ghq"
  install -Dm 644 misc/zsh/_ghq "$pkgdir/usr/share/zsh/site-functions/_ghq"
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/ghq/LICENSE"
}

# vim: set et sw=2 sts=2:

sha512sums=('SKIP')
