# Maintainer: Aleksandr Petrosyan a-p-petrosyan@yandex.ru 
_realname="qDoList"
pkgname="${_realname,,}"	# viva Bash 4.0
url="https://github.com/appetrosyan/qDoList"
pkgver=v0.1.6.1.g2513f35
pkgrel=1
pkgdesc="A to-do list manager for KDE"
arch=("x86_64")
license=('GPL3')
depends=(qt5-declarative hicolor-icon-theme)
makedepends=(git)
source=("git+https://github.com/appetrosyan/qDoList")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_realname"
    git describe --tags | sed -r 's/-/./g'
}

prepare() {
  cd "$srcdir/$_realname"
}

build() {
  cd "$srcdir/$_realname"
  qmake-qt5 "$_realname.pro"\
	    PREFIX=/usr \
	    QMAKE_CFLAGS="${CFLAGS}"\
	    QMAKE_CXXFLAGS="${FXXFLAGS}"\
	    QMAKE_LFLAGS="${LDFLAGS}"
  make -j
}

package(){
    cd "$srcdir/$_realname"
    install -D -m755 $_realname "$pkgdir/usr/bin/$pkgname"
    install -D -m644 "src/Icons/qDo.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$_realname.svg"
}
