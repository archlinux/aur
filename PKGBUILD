# Maintainer: CrocoDuck <crocoduck dot oducks at gmail dot com>
# Contributor: Giancarlo Bianchi <giancarlobianchi76@gmail.com>

pkgname=realtimeconfigquickscan-git
pkgver=r32.1235378
pkgrel=1
pkgdesc="Linux configuration checker for systems to be used for real-time audio."
arch=('any')
url="https://github.com/raboof/realtimeconfigquickscan"
license=('GPL')
depends=('perl-tk')
makedepends=('git')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("${pkgname%-*}::git+https://github.com/raboof/realtimeconfigquickscan.git"
        'realTimeConfigQuickScan'
        'QuickScan')
md5sums=('SKIP' '9ba860e66b4c53868fa874a4e00aba0f' 'fab72296c27305b0c8c36b6f88efa36b')

pkgver() {
  cd "${pkgname%-*}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd ${pkgname%-*}
  # Install Script Files:
  # *.pm files
  for i in *.pm; do
	install -Dm 755 "$i" "$pkgdir/usr/share/${pkgname%-*}/$i"
  done
  # *.pl files
  for i in *.pl; do
    	install -Dm 755 "$i" "$pkgdir/usr/share/${pkgname%-*}/$i"
  done
  # Install doc files:
  install -D COPYING  "$pkgdir/usr/share/doc/${pkgname%-*}/COPYING"
  install -D README.md  "$pkgdir/usr/share/doc/${pkgname%-*}/README.md"
  # Install Executable scripts:
  cd "$srcdir"
  install -Dm 755 realTimeConfigQuickScan "$pkgdir/usr/bin/realTimeConfigQuickScan"
  install -Dm 755 QuickScan "$pkgdir/usr/bin/QuickScan"
}
