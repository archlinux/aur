# Contributor: Ari Mizrahi <codemunchies at debugsecurity dot com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=peepdf
pkgver=0.4.2
pkgrel=2
pkgdesc="A python tool to explore PDF files in order to find out if the file can be harmful or not"
arch=('any')
url=https://github.com/jbremer/peepdf
license=('GPL3')
makedepends=('git')
depends=('python')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('cbce99242f507ef9526a4245b7692c15eaf12b21c8635d192ea2fcfb7d5e3390')

package() {
  cd $pkgname-$pkgver

  # Base directories.
  install -dm755 "$pkgdir"/usr/share/peepdf
  install -dm755 "$pkgdir"/usr/bin

  cp --no-preserve=ownership -R * "$pkgdir"/usr/share/peepdf

  cat > "$pkgdir"/usr/bin/peepdf <<EOF
#!/bin/sh
exec python /usr/share/peepdf/peepdf.py "\$@"
EOF

  chmod +x "$pkgdir"/usr/bin/peepdf
}
