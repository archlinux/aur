# Maintainer Chris Werner Rau <aur@cwrau.io>

pkgbase=vcutil
pkgname=(ipmikvm)
pkgver=1.44
pkgrel=5
pkgdesc="Misc. simple utilities to aid version control and host maintenance."
license=()
arch=('any')
depends=()
url=https://github.com/ossobv/vcutil
source=("$pkgbase.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('07a3db41f7ab0a7c3ad8772738aa8f6f2d7e17f07cc161670876e3fac3a5599a3c433bec39675a8afdb8f483b418d02e0d9ba9eac83e098d71f3f6dbd650ee77')

pkgdescs=(   [ipmikvm]="A wrapper to call the SuperMicro iKVM console bypassing Java browser plugins." )
pkgdepends=( [ipmikvm]="jre8-openjdk-headless unzip curl awk coreutils" )

for package in "${pkgname[@]}"; do
  read -r -d '' pkgfun <<EOF
function package_${package}() {
  pkgdesc="${pkgdescs[$package]}"
  depends=( ${pkgdepends[$package]} )

  install -Dm 755 "\$srcdir/$pkgbase-$pkgver/$package" -t "\$pkgdir/usr/bin"
}
EOF
  eval "$pkgfun"
done
