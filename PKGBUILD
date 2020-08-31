# Maintainer: J. Scheurich <mufti11@web.de>
pkgname=white_dune
pkgver=1.952
pkgrel=1
epoch=
pkgdesc="white_dune X3D/VRML97 tool, 3D modeller and animation-tool"
arch=('x64_86')
url="http://wdune.ourproject.org/"
license=('GPL')
groups=()
depends=(xorg-fonts-misc
         xorg-fonts-alias-misc
         povray
         mencoder
         awk
         git
         kdialog
)
makedepends=(gcc
             fakeroot
             glu 
             mesa 
             libx11 
             libxt 
             libxmu 
             libxext
             libxi
             libxp
             openmp
             openmotif
             libpng 
             libjpeg-turbo
             zlib
             expat
             ffmpeg
             opensubdiv
             clang
             flex
             bison
             gawk
             m4
             make
             git
             xdg-utils
             gedit
             lxterminal
             gimp
             audacity
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
md5sums=('a15bbc3fddb7440245c645c0b56421d9')
validpgpkeys=()

build() {
	cd "wdune-$pkgver"
	./configure --with-clang --with-optimization --prefix=/usr --without-devil --with-uninstallcomment="pacman -R white_dune" --with-optimization --with-helpurl="/usr/share/doc/$name/docs" --with-protobaseurl="/usr/share/doc/$name/docs" --with-checkincommand="ci" 
        make -j4
}

package() {
	cd "$pkgname-$pkgver"
        install -Dm755 bin/dune $pkgdir/usr/bin/dune 
        install -Dm755 tools/run_dune_and_aqsis.sh $pkgdir/usr/bin/run_dune_and_aqsis.sh 
        mkdir -p "$pkgdir/usr/share/doc/$name/docs"
        cp -r "docs" "$pkgdir/usr/share/doc/$name/"
        install -Dm644 desktop/kde/dune.desktop $pkgdir/usr/share/applications/dune.desktop
	install -Dm644 desktop/kde/dune.png $pkgdir/usr/share/pixmaps/dune.png
	install -Dm644 desktop/kde/dune4kids.desktop $pkgdir/usr/share/applications/dune4kids.desktop
	install -Dm644 desktop/kde/dune4kids.png $pkgdir/usr/share/pixmaps/dune4kids.png
	install -Dm644 include/white_dune/libC++RWD_namespace.h $pkgdir/usr/include/white_dune/libC++RWD_namespace.h
	install -Dm644 include/white_dune/libC++RWD.h $pkgdir/usr/include/white_dune/libC++RWD.h
	install -Dm644 include/white_dune/libCRWD.h $pkgdir/usr/include/white_dune/libCRWD.h
}
