pkgname=scangearmp-mx510series-x86_64
pkgver=1.90
pkgrel=1
pkgdesc="Canon Scanner Driver (MX510 Series) x86_64"
url="http://support-th.canon-asia.com/contents/TH/EN/0100413102.html"
arch=('x86_64')
license=('custom')
depends=('sane' 'pangox-compat')
conflicts=('scangearmp')
makedepends=('rpmextract')
source=('http://pdisp01.c-wss.com/gdl/WWUFORedirectTarget.do?id=MDEwMDAwNDEzMTAx&cmp=ACB&lang=EN')
md5sums=('d055b3dc640ebe1c6b60b77c78916b8e')

build() {
  cd "$startdir/src"
  tar -xf "$startdir/src/WWUFORedirectTarget.do?id=MDEwMDAwNDEzMTAx&cmp=ACB&lang=EN"
}

package() {
  cd $pkgdir
  rpmextract.sh $startdir/src/scangearmp-mx510series-$pkgver-$pkgrel-rpm/packages/scangearmp-common-$pkgver-$pkgrel.x86_64.rpm
  rpmextract.sh $startdir/src/scangearmp-mx510series-$pkgver-$pkgrel-rpm/packages/scangearmp-mx510series-$pkgver-$pkgrel.x86_64.rpm
  mkdir -p usr/share/licenses/${pkgname}
  mv usr/lib64 usr/lib
  chmod -R a+rX usr/
  mkdir -p usr/share/applications
  cat > usr/share/applications/scangearmp.desktop <<EOF
[Desktop Entry]
Version=1.0
Terminal=false
Type=Application
Name=Canon ScanGearMP
Exec=/usr/local/bin/scangearmp
Icon=scanner
Categories=Office;
EOF
}
