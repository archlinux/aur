# Maintainer Chris Werner Rau <aur@cwrau.io>

pkgbase=vcutil
pkgname=(ipmikvm)
pkgver=1.59 # renovate: datasource=github-tags depName=ossobv/vcutil
pkgrel=1
pkgdesc="Misc. simple utilities to aid version control and host maintenance."
license=()
arch=('any')
depends=()
url=https://github.com/ossobv/vcutil
source=("$pkgbase-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('64f336ba08d3899085b97c400443dfac04313d33610dfaf9ab5ad9a04ce745b12c15a7ff730b10cbe9943b7b15589287267fb0abce63957fd1189f43c701ac75')

declare -A pkgdescs
pkgdescs=([ipmikvm]="A wrapper to call the SuperMicro iKVM console bypassing Java browser plugins.")
declare -A pkgdepends
pkgdepends=([ipmikvm]="jre8-openjdk-headless unzip curl awk coreutils")

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
