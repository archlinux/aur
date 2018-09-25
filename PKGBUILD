# Maintainer: Joop Kiefte <joop@kiefte.net>
pkgname=ocean-data
pkgver=0.2
pkgrel=1
pkgdesc="The library data of the Ocean religious writings tool"
arch=('any')
url="http://bahai-education.org/ocean"
license=('custom')
makedepends=('p7zip')
source=('http://bahai-education.org/sites/default/files/uploadfiles/Ocean.dmg')
noextract=('Ocean.dmg')
md5sums=('54e727a44371f2e33cb945100f11861a')

build() {
  cd "Ocean/Ocean.app/Contents/Resources/drive_c/Ocean/"
  echo "Removing problematic elements"
  rm -r Library/Russian
  rm -r "Library/English/Baha'i/Authoritative Baha'i/Abdu'l-Baha/Provisional Translations/"
  echo "Done sanitizing"
}

prepare() {
	LANG=C 7z -y -scsUTF-8 x Ocean.dmg
}

package() {
  cd "Ocean/Ocean.app/Contents/Resources/drive_c/Ocean/"

  echo "Create dir"
  mkdir -p "$pkgdir/usr/share/ocean/"
  echo "Copy to dir"
  cp -r Library "$pkgdir/usr/share/ocean/"
  chmod 755 -R "$pkgdir/usr/share/ocean/"
}
