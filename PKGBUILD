# Maintainer Chris Werner Rau <aur@cwrau.io>

pkgbase=vcutil
pkgname=(ipmikvm)
pkgver=1.50 # renovate: datasource=github-tags depName=ossobv/vcutil
pkgrel=6
pkgdesc="Misc. simple utilities to aid version control and host maintenance."
license=()
arch=('any')
depends=()
url=https://github.com/ossobv/vcutil
source=("$pkgbase.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('d5fb6e33289aa4a9b907c4812777202cd99ab38ec65b2a2ca3eb6bd12e5a5ecbafde9499d38d50c6f0ba7c24f3ceddc0a878555019589123995ec732b3ebe07f')

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
