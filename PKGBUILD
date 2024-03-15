# Maintainer Chris Werner Rau <aur@cwrau.io>

pkgbase=vcutil
pkgname=(ipmikvm)
pkgver=1.43
pkgrel=4
pkgdesc="Misc. simple utilities to aid version control and host maintenance."
license=()
arch=('any')
depends=()
url=https://github.com/ossobv/vcutil
source=("$pkgbase::git+$url#tag=v$pkgver")
sha512sums=('SKIP')

pkgdescs=(   [ipmikvm]="A wrapper to call the SuperMicro iKVM console bypassing Java browser plugins." )
pkgdepends=( [ipmikvm]="jre8-openjdk-headless unzip curl awk coreutils" )

for package in "${pkgname[@]}"; do
  read -r -d '' pkgfun <<EOF
function package_${package}() {
  pkgdesc="${pkgdescs[$package]}"
  depends=( ${pkgdepends[$package]} )

  install -Dm 755 "\$srcdir/vcutil/$package" -t "\$pkgdir/usr/bin"
}
EOF
  eval "$pkgfun"
done
