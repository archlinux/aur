pkgname=colloid-hyprcursor
pkgver=20260623
pkgrel=1
pkgdesc="Colloid Dark Cursors converted to Hyprcursor format"
arch=('x86_64')
url="https://github.com/vinceliuice/Colloid-icon-theme/tree/main/cursors"
depends=(hyprcursor)
makedepends=(hyprcursor xcur2png colloid-cursors-git)
source=()
sha256sums=()
options=(!strip)

build() {
  hyprcursor-util -x /usr/share/icons/Colloid-cursors -o ${srcdir}
  mkdir colloid-cursors-hyprcursor
  hyprcursor-util -c "${srcdir}/extracted_Colloid-cursors" -o "${srcdir}/colloid-cursors-hyprcursor"
  find "$srcdir" -depth -name '* *' -execdir bash -c 'mv "$1" "${1// /_}"' _ {} \;
  mv colloid-cursors-hyprcursor/theme_Extracted_Theme colloid-cursors-hyprcursor/Colloid-hyprcursor
}

package() {
  install -d "${pkgdir}/usr/share/icons"
  cp -r "$srcdir/colloid-cursors-hyprcursor/Colloid-hyprcursor" "$pkgdir/usr/share/icons/"
}

