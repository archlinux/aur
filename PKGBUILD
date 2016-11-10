# Maintainer: Simon Vikstrom <aur@devsn.se>

pkgname=chef-client
pkgver=12.16.42
pkgrel=1
_ubuntuver=raring
_ubunturel=4
pkgdesc="The Chef Client installation package includes everything you need to start converging your machines."
arch=('x86_64')
url="https://downloads.chef.io/chef-client/"
license=('Apache')
depends=()
conflicts=( chef chef-solo )
source=("https://packages.chef.io/stable/ubuntu/12.04/chef_${pkgver}-1_amd64.deb")
sha512sums=('fc9adbb6dec79f432c37df2a5682627b72cd49ec207824a10edd985b3cb7bb6df987da0254c9f427cfcd2179048d0b4cc690fcb061dba7bd0b7e9c19585e10bd')

package() {
  cd "$srcdir"
  bsdtar -xf data.tar.gz -C "$pkgdir"

  # link executables
  binaries="chef-apply chef-shell knife chef-client chef-solo ohai"

  mkdir -p $pkgdir/usr/bin

  for binary in $binaries; do
    ln -s /opt/chef/bin/$binary $pkgdir/usr/bin/ || error_exit "Cannot link $binary to /usr/bin"
  done
  chown -Rh 0:0 $pkgdir
  chmod 755 $pkgdir/opt
}
