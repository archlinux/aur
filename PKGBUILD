# Maintainer: Mario Ray Mahardhika <leledumbo_cool@yahoo.co.id>
pkgname=voc-git
pkgver=v2.1.2.r9.ge376e59f
pkgrel=1
pkgdesc="A free and open source implementation of the Oberon-2 language and libraries."
arch=('i686' 'x86_64')
url="http://oberon.vishap.am"
license=('GPL3')
makedepends=('git')
depends=('gcc' 'make' 'diffutils')
optdepends=('clang')
source=("$pkgname::git+https://github.com/vishaps/voc")
md5sums=('SKIP')
install=$pkgname.install

# uncomment for clang backend, the default is gcc
# backend=clang

pkgver() {
  cd $pkgname
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $pkgname
  if [ "$backend" == "clang" ]
  then
    export CC=clang
  fi
  make full
}

package() {
  cd $pkgname
  mkdir -p "$pkgdir/opt/voc"
  cp -Rfp install/* "$pkgdir/opt/voc"
  mkdir -p "$pkgdir/usr/bin"
  ln -s /opt/voc/bin/voc "$pkgdir/usr/bin/voc"
  ln -s /opt/voc/bin/showdef "$pkgdir/usr/bin/showdef"
  ln -s /opt/voc/bin/ocat "$pkgdir/usr/bin/ocat"
}
