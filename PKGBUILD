# Maintainer: Evan Teitelman <teitelmanevan@gmail.com>
# Contributor: Max Roder <maxroder@web.de>
# Contributor: nofxx <x@nofxx.com>
# Moved 2 AUR4: GI_Jack <iamjacksemail@hackermail.com>
# Now with package improvements from ArchStrike

pkgname='bed'
pkgver='0.5'
pkgrel='5'
pkgdesc='Collection of scripts to test for buffer overflows, format string vulnerabilities.'
arch=('i686' 'x86_64')
url="http://www.aldeid.com/wiki/Bed"
license=('GPL')
depends=('perl')
source=("http://web.archive.org/web/20101229024258/http://www.remote-exploit.org/wp-content/uploads/2010/01/${pkgname}-${pkgver}.tar.gz")
sha256sums=('b829173e444bc896e39d0ec6b579ea15703d873c01ebba52cfb4cb20163cc7a2')

package() {
  cd "$srcdir/bed-$pkgver"

  install -dm755 "$pkgdir/usr/share/doc/bed"
  install -dm755 "$pkgdir/usr/share/bed"
  install -dm755 "$pkgdir/usr/bin"

  install -m755 bed.pl  "$pkgdir/usr/share/bed"

  cp --no-preserve=ownership -a bedmod "$pkgdir/usr/share/bed"
  cp --no-preserve=ownership -a docs/* "$pkgdir/usr/share/doc/bed"

  # Joint script.
  cat >> "$pkgdir/usr/bin/bed" <<EOF
#!/bin/sh
cd /usr/share/bed
./bed.pl "\$@"
EOF
  chmod +x "$pkgdir/usr/bin/bed"
}

