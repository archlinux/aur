# Maintainer Chris Werner Rau <aur@cwrau.io>

pkgbase=vcutil
pkgname=(ipmikvm)
pkgver=1.55 # renovate: datasource=github-tags depName=ossobv/vcutil
pkgrel=2
pkgdesc="Misc. simple utilities to aid version control and host maintenance."
license=()
arch=('any')
depends=()
url=https://github.com/ossobv/vcutil
source=("$pkgbase-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('7732ea801176e54094dd6618de02d2dc3d12e934c07138f9fe62c60809bb79ff0ef1b71db966c2fd00f214a0e856ce3e975c581a58742f84b94ab812c3b7b6ac')

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
