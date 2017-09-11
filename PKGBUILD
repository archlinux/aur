# Maintainer: Alex Butler <alexheretic@gmail.com>
pkgname=apart-gtk
pkgver=0.16
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
optdepends=('polkit: to run as non-root user'
            'zstd: adds compression option'
            'lz4: adds compression option')
makedepends=('rustup'
             'git')
source=("https://github.com/alexheretic/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('94c36f865ad3e3692942326589edf5b85a27081e12c337475ca3b210c46f7501')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
