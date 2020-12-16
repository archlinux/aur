# Contributor: Ari Mizrahi <codemunchies at debugsecurity dot com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=peepdf
pkgver=0.3
pkgrel=2
epoch=1
pkgdesc="A python tool to explore PDF files in order to find out if the file can be harmful or not"
arch=('any')
url=https://github.com/jesparza/peepdf
license=('GPL3')
makedepends=('git')
depends=('python2')
source=("$url/archive/$pkgname-$pkgver.tar.gz")
sha256sums=('e2038bf3379f93b5b62faaf39f47c6a096fc7655705e7edd808acb25e55c43a2')

prepare() {
  cd $pkgname-$pkgname-$pkgver
  find -name '*.py' -exec sed -i 's/env python$/env python2/' '{}' \;
}

package() {
  cd $pkgname-$pkgname-$pkgver

  # Base directories.
  install -dm755 "$pkgdir"/usr/share/peepdf
  install -dm755 "$pkgdir"/usr/bin

  cp --no-preserve=ownership -R * "$pkgdir"/usr/share/peepdf

  cat > "$pkgdir"/usr/bin/peepdf <<EOF
#!/bin/sh
exec python2 /usr/share/peepdf/peepdf.py "\$@"
EOF

  chmod +x "$pkgdir"/usr/bin/peepdf
}
