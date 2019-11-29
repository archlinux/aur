# Maintainer: Milk Brewster <milk on freenode>
_pkgname=anja
pkgname=${_pkgname}-git
pkgver=2.0.1.r1.256d30b
pkgrel=1
pkgdesc="A sample player/recorder for Jack"
arch=(x86_64)
url="https://github.com/milasudril/anja"
license=('GPL')
depends=('gtk3' 'gtksourceview3' 'jack' 'jemalloc' 'libsamplerate' 'libsndfile' 'ttf-linux-libertine')
makedepends=('xorg-server-xvfb' 'blender' 'graphviz' 'gcc' 'imagemagick' 'inkscape' 'markdown' 'ruby-ronn' 'octave' 'pkgconf' 'python3' 'xdotool' 'xorg-xdpyinfo' 'libxslt' 'texlive-core' 'texlive-bin' 'texlive-latexextra' 'texlive-science' 'git' 'jq' 'jansson')
provides=()
conflicts=()
source=('git+https://github.com/milasudril/anja')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${_pkgname%-git}"

# Git, tags available
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
	cd "$srcdir/${_pkgname%-git}"
  # https://wiki.archlinux.org/index.php/TeX_Live#Fonts ??
  git submodule init && git submodule update
}


build() {
	cd "$srcdir/${_pkgname%-git}"
	make
}

package() {
	cd "$srcdir/${_pkgname%-git}"
  #  make DESTDIR="$pkgdir/" install
  mkdir $pkgdir/usr
  ./install $pkgdir/usr
}
