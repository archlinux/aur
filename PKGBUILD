# Maintainer: Simon Vikstrom <aur@devsn.se>

pkgname=chef-client
pkgver=12.19.36
pkgrel=1
_ubuntuver=xenial
pkgdesc="The Chef Client installation package includes everything you need to start converging your machines."
arch=('x86_64')
url="https://downloads.chef.io/chef-client/"
license=('Apache')
depends=()
conflicts=( chef chef-solo )
source=("https://packages.chef.io/stable/ubuntu/16.04/chef_${pkgver}-1_amd64.deb")
sha512sums=('043c5401728b4de8cdf357b504d8c08f94545bcb68e96047133706e5e009bc4a5886eff51ae7694acbd4b3e7bafffebe232493d35ad6c16c746c3e8df4a663b2')

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
