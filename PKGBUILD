# Maintainer: Gabriel Magno <gabrielmagno1@gmail.com>

_pkgname=vimdecrypt
pkgname=vimdecrypt-git
pkgver=r32.2ab3280
pkgrel=2
pkgdesc="Command line tool for decrypting vim-blowfish-encrypted files."

arch=('i686' 'x86_64')
url="https://github.com/gertjanvanzwieten/vimdecrypt"
license=('GPL2')

makedepends=('git' 'python-build' 'python-installer' 'python-wheel')
depends=('python-blowfish')

source=("git+https://github.com/gertjanvanzwieten/vimdecrypt.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$_pkgname"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
