# Maintainer: Alex Butler <alexheretic@gmail.com>
pkgname=apart-gtk
pkgver=0.26
pkgrel=1
pkgdesc="Linux GUI for cloning & restoring disk partitions to & from compressed image files."
arch=('x86_64')
url="https://github.com/alexheretic/apart-gtk"
license=('GPL3')
depends=('python'
         'python-setuptools'
         'python-gobject'
         'python-yaml'
         'python-pyzmq'
         'python-humanize'
         'gtk3'
         'partclone'
         'zeromq'
         'zstd')
optdepends=('polkit: to run as non-root user'
            'pigz: adds compression option'
            'lz4: adds compression option')
makedepends=('rustup'
             'git')
source=("https://github.com/alexheretic/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('32c89b14de008442d95a61014340b693267bdfd8b4272b779f0b4e66202b8db6')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
