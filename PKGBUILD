# Maintainer Chris Werner Rau <aur@cwrau.io>

pkgbase=vcutil
pkgname=(ipmikvm)
pkgver=1.43
pkgrel=2
pkgdesc="Misc. simple utilities to aid version control and host maintenance."
license=()
arch=('any')
depends=()
url=https://github.com/ossobv/vcutil/
source=("$pkgbase::git+$url#tag=v$pkgver")
sha512sums=('SKIP')

pkgdescs=( [ipmikvm]="A wrapper to call the SuperMicro iKVM console bypassing Java browser plugins.")
pkgdepends=( [ipmikvm]="java-runtime-headless=8 unzip curl awk coreutils")

for package in "${pkgname[@]}"; do
  read -r -d '' pkgfun <<EOF
function package_${package}() {
  pkgdesc="${pkgdescs[$package]}"
  depends=( ${pkgdepends[$package]} )

  echo hi
  install -Dm 755 "\$srcdir/vcutil/$package" -t "\$pkgdir/usr/bin"
}
EOF
  eval "$pkgfun"
done
