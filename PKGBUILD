# Maintainer: aksr <aksr at t-com dot me>
pkgname=rar2fs
pkgver=1.27.1
_unrarver=5.6.8
pkgrel=2
pkgdesc="Fuse file system for reading Rar archives"
arch=("i686" "x86_64")
license=("GPLv3")
url="https://github.com/hasse69/rar2fs"
url="https://hasse69.github.io/rar2fs/"
depends=("fuse3" "libunrar")
makedepends=("libunrar")
source=("https://github.com/hasse69/rar2fs/releases/download/v$pkgver/rar2fs-$pkgver.tar.gz"
        "http://www.rarlab.com/rar/unrarsrc-$_unrarver.tar.gz")
md5sums=('c84943782f2f6781c9b4a3da2a3ef0d9'
         'def579782da17dc85940cda559b92287')
sha1sums=('882f620e3a30158c1ab5548cb524ea3f32fda749'
          '69f17f64a605d666d8630a09234e15f8a0334ef6')
sha256sums=('f7e84b813fe82c6a886313e13a85d4f0d229b21f343a3ce6f73325a4ac90cb5a'
            'a4cc0ac14a354827751912d2af4a0a09e2c2129df5766576fa7e151791dd3dff')

build() {
  cd "$srcdir/unrar"
  make lib
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --sbindir=/usr/bin --with-unrar=../unrar
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make install DESTDIR="$pkgdir"
}

