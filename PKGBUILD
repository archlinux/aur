# Maintainer: Billy Rond <billy dot rond at gmail dot com>
# Maintainer: Previously Michal Kowalski <kowalski TOD michal TA gmail TOD com>

pkgname=gaviewer
_rpkgname=GAViewer
pkgver=0.86
pkgrel=5
epoch=
pkgdesc="Geometric Algebra scriptable 3D visualization tool"
arch=('x86_64')
url="http://www.geometricalgebra.net/downloads.html"
license=('GPL2')
groups=('math')
depends=('fltk' 'libgl' 'mesa' 'libx11' 'libpng' 'gcc-libs')
makedepends=('antlr2' 'zlib')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(http://www.geometricalgebra.net/downloads/${_rpkgname}-$pkgver.tar.gz
        http://www.geometricalgebra.net/downloads/figures.zip
        http://www.geometricalgebra.net/downloads/gaviewer.pdf
        http://www.geometricalgebra.net/downloads/gaviewerexercises.pdf
        http://www.geometricalgebra.net/images/tour_fig_3_3.png)
noextract=()
md5sums=('ce5285dfa74db56a4ba7577a1a5e6738'
         '172fc88d38e3b29960e33788a1a4f045'
         '43fd8ca7da3e0cac3fee2350d05c9d3e'
         '60543f7f310292e9c70e9d98dd095c9e'
         '5f11e0c234f4223314ed85aca7233cdc')

build() {
  cd "$srcdir/${_rpkgname}-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/${_rpkgname}-$pkgver"
  make DESTDIR="$pkgdir/" install
  mkdir -p "$pkgdir/usr/share/doc/$pkgname"
  cp $srcdir/gaviewer.pdf $srcdir/gaviewerexercises.pdf \
    "$pkgdir/usr/share/doc/$pkgname/"
  chmod -x $srcdir/Figures/*
  cp -r $srcdir/Figures "$pkgdir/usr/share/doc/$pkgname/Figures"
  mkdir -p "$pkgdir/usr/share/pixmaps/$pkgname"
  cp $srcdir/tour_fig_3_3.png "$pkgdir/usr/share/pixmaps/$pkgname/"
  mkdir -p "$pkgdir/usr/share/applications/"
  echo "[Desktop Entry]

  # The type as listed above
  Type=Application
  
  # The version of the desktop entry specification to which this file complies
  Version=0.86
  
  # The name of the application
  Name=gaviewer
  
  # A comment which can/will be used as a tooltip
  Comment=Geometric algebra viewer and experimenter
  
  # The path to the folder in which the executable is run
  Path=/usr/bin/gaviewer
  
  # The executable of the application, possibly with arguments.
  Exec=gaviewer
  
  # The name of the icon that will be used to display this entry
  Icon=/usr/share/pixmaps/gaviewer/tour_fig_3_3.png
  
  # Describes whether this application needs to be run in a terminal or not
  Terminal=false
  
  # Describes the categories in which this entry should be shown
  Categories=Education;Math;
  StartupNotify=false" > "$pkgdir/usr/share/applications/${pkgname}.desktop"
  }
  
  # vim:set ts=2 sw=2 et: