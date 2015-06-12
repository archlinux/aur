# Maintainer: Michael Schubert <mschu.dev at google mail>
pkgname=augustus
pkgver=2.5.5
pkgrel=1
pkgdesc="A eucaryotic gene prediction program"
arch=('i686' 'x86_64')
url="http://augustus.gobics.de/"
license=('custom:Artistic-2.0')
depends=('perl')
source=("http://augustus.gobics.de/binaries/$pkgname.$pkgver.tar.gz"
        "http://augustus.gobics.de/binaries/LICENCE.TXT")
md5sums=('234adc8fe4c2ff0b70715fbf00173668'
         '7e2216d2af60d1644c220cbad40b0e36')
options=(!strip)

build() {
  cd $pkgname.$pkgver
  make all
}

package() {
  cd $pkgname.$pkgver

  mkdir -p "$pkgdir/usr/share/augustus/scripts"
  mkdir -p "$pkgdir/etc/"{augustus,profile.d}

  cp -R bin "$pkgdir/usr/"
  cp -R config "$pkgdir/etc/augustus/"
  cp -R {docs,examples} "$pkgdir/usr/share/augustus/"
  cp scripts/*.pl "$pkgdir/usr/share/augustus/scripts/"

  echo export AUGUSTUS_CONFIG_PATH="/etc/augustus/config/" > "$pkgdir/etc/profile.d/augustus.sh"
  chmod a+rx "$pkgdir/etc/profile.d/augustus.sh"

  install -Dm644 "$srcdir/LICENCE.TXT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

