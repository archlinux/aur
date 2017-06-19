# Maintainer: Tinu Weber <martin.weber@epfl.ch>

pkgname=epfl-scripts-git
_pkgname=epfl-scripts
pkgver=r46.d6570b3
pkgrel=1
pkgdesc="Collection of scripts for simplifying one's life at the EPFL"
arch=('any')
url='https://gitlab.gnugen.ch/mtweber/epfl-scripts'
license=('Apache')
provides=(epfl-scripts)
conflicts=(epfl-scripts)
depends=(coreutils)
source=('git+https://gitlab.gnugen.ch/mtweber/epfl-scripts.git')
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  depends+=(curl file openconnect perl-html-tree perl-io-stringy
            perl-lwp-protocol-https perl-html-treebuilder-xpath
            perl-www-mechanize perl-xml-xpathengine sh)
  cd "$srcdir"/"$_pkgname"
  install -Dm 755 bin/epfl-vpn "$pkgdir"/usr/bin/epfl-vpn
  install -Dm 755 bin/gnupaste "$pkgdir"/usr/bin/gnupaste
  install -Dm 755 bin/pastegnugen.pl "$pkgdir"/usr/bin/pastegnugen.pl
  install -Dm 755 bin/tl.pl "$pkgdir"/usr/bin/tl.pl
  install -Dm 755 bin/velo.pl "$pkgdir"/usr/bin/velo.pl
}
