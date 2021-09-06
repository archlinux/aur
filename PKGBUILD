# Maintainer: Gyara <laxect39@gmail.com>

pkgname=beancount-language-server-git
_pkgname=beancount-language-server
pkgver=r109.179c798
pkgrel=1
pkgdesc="A Language Server Protocol (LSP) for beancount files"
arch=('any')
url="https://github.com/polarmutex/beancount-language-server"
conflicts=('beancount-language-server')
provides=('beancount-language-server')
license=('MIT')
depends=('cargo' 'beancount')
makedepends=('npm' 'git')
source=("git+${url}.git")
sha512sums=('SKIP')

pkgver() {
  cd "${_pkgname}/"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${_pkgname}"
    cargo build --release --target-dir=target
}

package() {
    cd "${srcdir}/${_pkgname}"
    install -Dm755 "target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
