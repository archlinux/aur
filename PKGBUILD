# Maintainer: Tomas Jasek <tomsik68(at)gmail(dot)com>
# Contributor: Aisberg
# Contributor: The_Loko

pkgname="aptana-studio"
pkgver="3.6.1"
pkgrel=4
pkgdesc="Aptana Studio 3.6.1 is code base and complete eclipse-based environment that includes extensive capabilities to build Ruby and Rails, PHP, and Python applications, along with complete HTML, CSS and JavaScript editing. "
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
source_i686=("https://github.com/aptana/studio3/releases/download/v3.6.1/studio3.linux.gtk.x86_${pkgver}.zip")
md5sums=('6b3b2d4809ac7c92c312950f06224387')
md5sums_i686=('325f503d5e93bc51957a8e830db7ad56')
md5sums_x86_64=('b9d34433e0cd06061df962fe26e25c98')
source_x86_64=("https://github.com/aptana/studio3/releases/download/v3.6.1/studio3.linux.gtk.x86_64_${pkgver}.zip")
source=("aptana-studio.desktop")
noextract=()

build() {
  cd $srcdir
  bsdtar -xf *.zip
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
  install -m775 $srcdir/usr/bin/aptana-studio $pkgdir/usr/bin/aptana-studio
  install -Dm644 $srcdir/aptana-studio.desktop "${pkgdir}/usr/share/applications/aptana-studio.desktop"
}
