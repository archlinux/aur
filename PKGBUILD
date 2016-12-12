# Maintainer: Simon Vikstrom <aur@devsn.se>

pkgname=chef-client
pkgver=12.17.44
pkgrel=1
_ubuntuver=xenial
pkgdesc="The Chef Client installation package includes everything you need to start converging your machines."
arch=('x86_64')
url="https://downloads.chef.io/chef-client/"
license=('Apache')
depends=()
conflicts=( chef chef-solo )
source=("https://packages.chef.io/stable/ubuntu/16.04/chef_${pkgver}-1_amd64.deb")
sha512sums=('c29122c7da1a7757daa3796e1ed5c481c99399d80ad396f43c9b68fb1051fd418e1fa24b8302c03e8acee061490bddc24e14280628c88cd221fc396150fdc6af')

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
