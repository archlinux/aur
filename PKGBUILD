# Maintainer Chris Werner Rau <aur@cwrau.io>

pkgbase=vcutil
pkgname=(ipmikvm)
pkgver=1.43
pkgrel=5
pkgdesc="Misc. simple utilities to aid version control and host maintenance."
license=()
arch=('any')
depends=()
url=https://github.com/ossobv/vcutil
source=("$pkgbase.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('6578e5d09aa44ef64b63a4678424178c77bb39b9a7dfb7b0d641b42ca894726a25e977b0af6aed225bdb3f577f3d32a96a7f2e1cb000ee985391fc759ca55ee9')

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
