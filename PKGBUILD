# Maintainer Chris Werner Rau <aur@cwrau.io>

pkgbase=vcutil
pkgname=(ipmikvm)
pkgver=1.56 # renovate: datasource=github-tags depName=ossobv/vcutil
pkgrel=1
pkgdesc="Misc. simple utilities to aid version control and host maintenance."
license=()
arch=('any')
depends=()
url=https://github.com/ossobv/vcutil
source=("$pkgbase-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('d71e48b3084c68aebfa12560d4a5fe24b2744a9600f631092d9477ac224181bcb02db5caa1547bb1d4b83558a8f954effdc34ada72a3d3d56a4d735a3e2f1e9f')

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
