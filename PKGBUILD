# Maintainer: Luke R. <g4jc@openmailbox.org> GPG: rsa4096/3EAE8697

pkgname=slowrx-git
_gitname=slowrx
pkgver=r128.1760187
pkgrel=1
pkgdesc="An SSTV decoder that aims for intuitive simplicity and lack of features not needed by a shortwave listener (SWL)."
url="https://windytan.github.io/slowrx/"
license=('MIT')
arch=('i686' 'x86_64')
makedepends=("git")
depends=("gtk3" "fftw" "alsa-lib")
conflicts=("slowrx")
source=("git+https://github.com/windytan/slowrx.git")
sha512sums=('SKIP')

pkgver() {
	cd "$srcdir/$_gitname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
cd "$srcdir/$_gitname"
sed -i -e 's|"slowrx.ui"|"/usr/share/slowrx/slowrx.ui"|' -e 's|"aboutdialog.ui"|"/usr/share/slowrx/aboutdialog.ui"|' gui.c
}


build() {
cd "$srcdir/$_gitname"
    make
}

package() {
cd "$srcdir/$_gitname"
   install -D "slowrx"  ${pkgdir}/usr/bin/$_gitname
   install -D -m 644 "aboutdialog.ui" "slowrx.ui" -t ${pkgdir}/usr/share/$_gitname
}
