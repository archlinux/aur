# Maintainer: Tomas Jasek <tomsik68(at)gmail(dot)com>
# Contributor: Aisberg
# Contributor: The_Loko

pkgname="aptana-studio"
pkgver="3.7.2.201807301111"
pkgrel=2
pkgdesc="Aptana Studio is code base and complete eclipse-based environment that includes extensive capabilities to build Ruby and Rails, PHP, and Python applications, along with complete HTML, CSS and JavaScript editing. "
arch=('i686' 'x86_64')
url="http://www.aptana.com/products/studio3/download.html"
license=('GPL3')
groups=()
depends=('java-runtime')
makedepends=(tar)
optdepends=('webkitgtk2: internal browser support'
			'chromium: internal browser support'
		   )
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
md5sums=('6b3b2d4809ac7c92c312950f06224387')
md5sums_x86_64=('a09490d152669151c9d4bce463dc5446')
source_x86_64=("https://github.com/aptana/studio3/releases/download/3.7.2.201807301111/aptana.studio-linux.gtk.x86_64.zip")
source=("aptana-studio.desktop")
noextract=()

build() {
  cd $srcdir
  mkdir -p Aptana_Studio_3
  bsdtar -xf *.zip -C Aptana_Studio_3
  mkdir -p $srcdir/usr/bin/
  echo 'exec /usr/lib/aptana/AptanaStudio3' > $srcdir/usr/bin/aptana-studio
}

package() {
  cd $srcdir
  mkdir -p $pkgdir/usr/lib/aptana
  mv Aptana_Studio_3 $pkgdir/usr/lib/
  cd $pkgdir/usr/lib/
  mv Aptana_Studio_3/* aptana
  rm -rf Aptana_Studio_3
  mkdir -p $pkgdir/usr/bin/
  install -m775 $srcdir/AptanaStudio3 $pkgdir/usr/lib/aptana/AptanaStudio3
  install -m775 $srcdir/usr/bin/aptana-studio $pkgdir/usr/bin/aptana-studio
  install -Dm644 $srcdir/aptana-studio.desktop "${pkgdir}/usr/share/applications/aptana-studio.desktop"
}
