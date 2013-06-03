# Maintainer: jjacky
# Contributor: Michał Siejak <my_fistname@my_lastname.pl>
pkgname=xlsh-without-x
pkgver=0.2.2
pkgrel=2
pkgdesc="eXtended Login Shell - fast, minimalistic login replacement (without X support)"
arch=('i686' 'x86_64')
url="https://github.com/Nadrin/xlsh/wiki"
license=('GPL3')
depends=('pam' 'readline')
provides=('xlsh=0.2.2')
source=(https://github.com/Nadrin/xlsh/tarball/master
	patch)
install=xlsh.install

prepare() {
    cd "$srcdir"

    folder=$(ls |grep Nadrin)
    mv $folder/* .
    rmdir $folder

    patch -p1 -i patch

    sed -e 's/$(exec_prefix)\/sbin/$(exec_prefix)\/bin/' -i Makefile
}

build() {
  cd "$srcdir"
  make
}

package() {
  cd "$srcdir"
  make DESTDIR="$pkgdir" install
}

md5sums=('cf78ceec269cc3e35797fe6e8631c3b3'
         'bf4e6b42787da0988ae56456d1246937')
