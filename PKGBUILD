# Maintainer: Alex Butler <alexheretic@gmail.com>
pkgname=apart-gtk
pkgver=0.27
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
source=("$pkgname-$pkgver.tar.gz::https://github.com/alexheretic/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7446ec4a25a1c74fb09f6089f7429fa76d84b9c0cb8048f690432d8a1811037e')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
