# Maintainer Chris Werner Rau <aur@cwrau.io>

pkgbase=vcutil
pkgname=(ipmikvm)
pkgver=1.54 # renovate: datasource=github-tags depName=ossobv/vcutil
pkgrel=1
pkgdesc="Misc. simple utilities to aid version control and host maintenance."
license=()
arch=('any')
depends=()
url=https://github.com/ossobv/vcutil
source=("$pkgbase.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('b6502b7fa50a99fa03397e98ac23b92a4dfb043fe14ed56ef9a65a1816277cffaec3692ae19274625650523097ae46ce01b8bef28f44c36db85d1d4b6af3cfdd')

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
