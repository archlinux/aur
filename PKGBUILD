# Maintainer: Trevor Bramble <inbox@trevorbramble.com>

pkgname=chef-workstation
pkgver=0.2.35
pkgrel=1
_ubunturel=18
_ubuntuver=04
pkgdesc="Chef Workstation gives you everything you need to get started with Chef. Start scanning and configuring your environments today with InSpec and chef-run."
arch=('x86_64')
url="https://downloads.chef.io/chef-workstation/"
license=('Apache')
depends=()
conflicts=(chef-dk chef chef-solo chef-client)
source=("https://packages.chef.io/files/stable/${pkgname}/${pkgver}/ubuntu/${_ubunturel}.${_ubuntuver}/${pkgname}_${pkgver}-1_amd64.deb")
sha256sums=('f2c23e3d7c0eb1efe25361da404077f7ad757800026b46213d49018e14665b2e')

package() {
  cd "$srcdir"
  bsdtar -xf data.tar.xz -C "$pkgdir"

  mkdir -p "$pkgdir/usr/bin"

  chefdk_binaries="berks chef chef-apply chef-client chef-shell chef-solo chef-vault cookstyle dco delivery foodcritic inspec kitchen knife ohai push-apply pushy-client pushy-service-manager"
  binaries="chef-run chefx $chefdk_binaries"

  for binary in $binaries; do
    ln -s "/opt/$pkgname/bin/$binary" "$pkgdir/usr/bin/" || error_exit "Cannot link $binary to /usr/bin"
  done

  chown -Rh 0:0 "$pkgdir"
  chmod -R 755 "$pkgdir/opt"
}
