# Maintainer: Mario Ray Mahardhika <leledumbo_cool@yahoo.co.id>
pkgname=voc-git
pkgver=2.1.0.r31.g1bd70f3
pkgrel=1
pkgdesc="A free and open source implementation of the Oberon-2 language and libraries."
arch=('i686' 'x86_64')
url="http://oberon.vishap.am"
license=('GPL3')
makedepends=('git')
depends=('gcc' 'make' 'diffutils')
optdepends=('clang')
source=('src::git+https://github.com/vishaps/voc')
md5sums=('SKIP')
install=$pkgname.install

# uncomment for clang backend, the default is gcc
# backend=clang

pkgver() {
  cd src
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd src
  if [ "$backend" == "clang" ]
  then
    export CC=clang
  fi
  make full
}

package() {
  cd src
  mkdir -p "$pkgdir/opt/voc"
  cp -Rfp install/* "$pkgdir/opt/voc"
  mkdir -p "$pkgdir/usr/bin"
  ln -s /opt/voc/bin/voc "$pkgdir/usr/bin/voc"
  ln -s /opt/voc/bin/showdef "$pkgdir/usr/bin/showdef"
  ln -s /opt/voc/bin/ocat "$pkgdir/usr/bin/ocat"
}
