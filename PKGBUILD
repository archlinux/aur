# Maintainer: mrtc0 <mrtc0.py at gmail dot com>

pkgname=nsearch_kai-git
pkgver=v0.1.r0.g5bd48d3
pkgrel=1
pkgdesc='NSE(Nmap Scripting Engine Search tool'
arch=('any')
url=('https://github.com/mrt-k/nsearch_kai')
license=('MIT')
_licensefile=('LICENSE.txt')
depends=('python3')
makedepends=('git')
conflicts=()
replaces=()
backup=()
source=('git://github.com/mrt-k/nsearch_kai.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/nsearch_kai"
  git describe --long --tags|sed 's/\([^-]*-g\)/r\1/;s/[-_]/./g;s/^release.//'
}

package() {
  cd "$srcdir/nsearch_kai"

  # Base directories.
  install -dm755 "$pkgdir/usr/bin"
  install -dm755 "$pkgdir/opt/nsearch_kai"

  cp -R --no-preserve=ownership * "$pkgdir/opt/nsearch_kai"

  cat > "$pkgdir/usr/bin/nsearch_kai" << EOF
#!/bin/bash
cd /opt/nsearch_kai/
python3 nsearch_kai.py "\$@"
EOF
  chmod 755 "$pkgdir/usr/bin/nsearch_kai"
}
