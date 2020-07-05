# Maintainer: J. Scheurich <mufti11@web.de>
pkgname=white_dune
pkgver=1.900
pkgrel=2
epoch=
pkgdesc="A graphical VRML97/X3D editor, simple NURBS/Superformula 3D modeller, animation tool and VRML97/X3DV commandline compiler"
arch=('any')
url="http://wdune.ourproject.org/"
license=('GPL')
groups=()
optdepends=('aqsis')
depends=(xorg-fonts-misc
         xorg-fonts-alias-misc
         povray
)
makedepends=( 
# the following are part of base-devel
             fakeroot
             flex
             bison
             gawk
             m4
             make
# end part of base-devel
             clang
             glu
             mesa
             libx11
             libxt
             libxmu
             libxext
             libxi
             libxp
             openmotif
             libpng
             libjpeg-turbo
             zlib
             expat
             ffmpeg
             opensubdiv
             rcs
             xdg-utils
             lxterminal
             gimp
             audacity
             cinelerra-cv
             kolourpaint
             imagemagick
             netpbm
             freeglut
             jdk8-openjdk
             cgal
             boost
             curl
             freetype2
             ttf-bitstream-vera
)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("ftp://ftp.ourproject.org/pub/wdune/wdune-$pkgver.tar.bz2")
noextract=()
md5sums=('af953ae716562c575270d20dc701bc7e')
validpgpkeys=()

build() {
        export CC=clang
        export CXX=clang++
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr --without-devil --with-uninstallcomment="pacman -R white_dune" --with-optimization --with-helpurl="/usr/share/doc/$pkgname/docs" --with-protobaseurl="/usr/share/doc/$pkgname/docs" --with-checkincommand="ci"
        make
}

check() {
	cd "$pkgname-$pkgver"
}

package() {
	cd "$pkgname-$pkgver"
        install -Dm755 bin/dune $pkgdir/usr/bin/dune
        mkdir -p "$pkgdir/usr/share/doc/$pkgname/docs"
        cp -r "docs" "$pkgdir/usr/share/doc/$pkgname/docs"
        install -Dm644 desktop/kde/dune.desktop $pkgdir/usr/share/applications/dune.desktop
	install -Dm644 desktop/kde/dune.png $pkgdir/usr/share/pixmaps/dune.png
	install -Dm644 desktop/kde/dune4kids.desktop $pkgdir/usr/share/applications/dune4kids.desktop
	install -Dm644 desktop/kde/dune4kids.png $pkgdir/usr/share/pixmaps/dune4kids.png
}
