# Maintainer: Lucas Saliés Brum <sistematico@gmail.com>
pkgname=termsaver-git 
pkgver=r181.12f9989
pkgrel=1
pkgdesc="Simple text-based Terminal Screensaver"
arch=('x86_64')
url="http://termsaver.brunobraga.net/"
license=('GPL')
depends=('python' 'python-pip' 'python-pillow')
makedepends=('git') 
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/brunobraga/termsaver.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  #python -m build --wheel --no-isolation
  python -m build
}

package() {
  cd "$srcdir/${pkgname%-git}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
