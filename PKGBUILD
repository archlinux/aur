# Maintainer: Alex Butler <alexheretic@gmail.com>
pkgname=apart-gtk
pkgver=0.7
pkgrel=1
pkgdesc="Linux GUI for cloning & restoring disk partitions to & from compressed image files."
arch=('any')
url="https://github.com/alexheretic/apart-gtk"
license=('GPL3')
depends=('python'
         'python-gobject'
         'python-yaml'
         'python-pyzmq'
         'python-humanize'
         'gtk3'
         'pigz'
         'partclone'
         'zeromq')
optdepends=('polkit: to run as non-root user')
makedepends=('python-pip'
             'python-wheel'
             'rustup'
             'git')
source=("https://github.com/alexheretic/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('d6c10a85dd8284de0716b700ebb3489552702ebec641c96ab16ef56d426da0db')

build() {
  cd "$pkgname-$pkgver"
  # build to ./target
  ./build-dist --no-python-deps
}

package() {
  cd "$pkgname-$pkgver"
  mkdir -p "$pkgdir/usr/"
  cp -r target/* "$pkgdir/usr/"
}
