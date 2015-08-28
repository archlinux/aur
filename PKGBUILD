# Maintainer: Ari Mizrahi <codemunchies at debugsecurity dot com>

pkgname=peepdf
pkgver=svn
pkgrel=5
pkgdesc="A python tool to explore PDF files in order to find out if the file can be harmful or not"
arch=('any')
url=('https://github.com/jesparza/peepdf')
license=('GPL3')
makedepends=('subversion')
depends=('python2' 'python2-simplejson')
source=('svn+http://peepdf.googlecode.com/svn/trunk/')
md5sums=('SKIP')

prepare() {
  cd "$srcdir/trunk"

  find -name '*.py' -exec sed -i 's/env python$/env python2/' '{}' \;
}

package() {
  cd "$srcdir/trunk"

  # Base directories.
  install -dm755 "$pkgdir/usr/share/peepdf"
  install -dm755 "$pkgdir/usr/bin"

  cp --no-preserve=ownership -R * "$pkgdir/usr/share/peepdf"

  cat > "$pkgdir/usr/bin/peepdf" <<EOF
#!/bin/sh
exec python2 /usr/share/peepdf/peepdf.py "\$@"
EOF

  chmod +x "$pkgdir/usr/bin/peepdf"
}
