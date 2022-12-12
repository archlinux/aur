# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Oliver Rümpelein <arch@pheerai.de>

pkgname=mergerfs
pkgver=2.34.1
pkgrel=1
pkgdesc="Featureful union filesystem"
arch=('x86_64')
url="https://github.com/trapexit/mergerfs"
license=('custom:ISC')
# Optional makedepend: 'pandoc: build man page'
makedepends=('git')
#optdepends=('fuse2: mount via fstab' 'mergerfs-tools: manage data in a pool')
optdepends=('fuse2: mount via fstab' 'mergerfs-tools-git: manage data in a pool')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
#source=("$pkgname-$pkgver.tar.gz::$url/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('44a72e0d7fda7267a0062a783e029c43550af7964deb65d52088661006107de6')

prepare() {
  sed -i 's|^\(VERSION=\).*|\1"'$pkgver'"|' $pkgname-$pkgver/tools/update-version
}

build() {
  make -C $pkgname-$pkgver
}

package() {
  install -Dm644 $pkgname-$pkgver/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  make -C $pkgname-$pkgver DESTDIR="$pkgdir" PREFIX=/usr SBINDIR=/usr/bin install
}

