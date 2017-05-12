# Maintainer: Alex Butler <alexheretic@gmail.com>
pkgname=apart-gtk
pkgver=0.9
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
sha256sums=('448c81d0455a5786c73095bc96def1e5f8ead076808845553fe608f11100ec71')

build() {
  cd "$pkgname-$pkgver"
  ./configure --no-python-deps --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
