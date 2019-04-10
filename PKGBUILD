# Maintainer: manky
pkgname=xfce4-nameday-plugin-git
_pkgname=xfce-nameday-plugin
pkgver=r10.28f8af1
pkgrel=1
pkgdesc="Xfce Applet ,that's show namedays"
url="https://gitlab.com/git-mp/xfce-stuff"
arch=('i686' 'x86_64')
license=('GPL')
provides=(xfce4-nameday-plugin)
depends=('xfce4-panel' 'libunique')
makedepends=('pkgconfig' 'xfce4-dev-tools' 'intltool' 'git')
source=("git+https://gitlab.com/git-mp/xfce-stuff.git")
md5sums=('SKIP')



pkgver() {
  cd "$srcdir/xfce-stuff/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  msg "Building..." 		
  cd "$srcdir/xfce-stuff/${_pkgname}"
 ./autogen.sh --prefix=/usr
  make
  msg "Building end"
}

package() {
  cd "$srcdir/xfce-stuff/${_pkgname}"

  make DESTDIR="$pkgdir/" install
}
