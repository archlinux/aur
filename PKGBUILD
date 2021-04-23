# Maintainer: Alex Butler <alexheretic@gmail.com>
pkgname=apart-gtk
pkgver=0.25
pkgrel=2
pkgdesc="Linux GUI for cloning & restoring disk partitions to & from compressed image files."
arch=('x86_64')
url="https://github.com/alexheretic/apart-gtk"
license=('GPL3')
depends=('python'
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
source=("https://github.com/alexheretic/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('db0455311572b22dffe7fa3ca7032b93e1f3663f1fb5777fa550a9e808c302f4')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
