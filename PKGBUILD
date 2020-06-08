# Maintainer: Marc Paradise <marc.paradise@gmail.com>

pkgname=chef-workstation
pkgver=20.6.62
pkgrel=1
pkgdesc="Chef Workstation gives you everything you need to get started with Chef. Start scanning and configuring your environments today with InSpec and chef-run."
arch=('x86_64')
url="https://downloads.chef.io/chef-workstation/"
license=('Apache')
depends=()
conflicts=(chef-dk chef chef-solo chef-client)
source=('https://packages.chef.io/files/stable/chef-workstation/20.6.62/ubuntu/18.04/chef-workstation_20.6.62-1_amd64.deb')
sha256sums=('5fe63be26bfa9746f807b0130cc9c14a955557a91d6501155c1e263e57ab5abc')

package() {
  cd "$srcdir"
  bsdtar -xf data.tar.xz -C "$pkgdir"

  mkdir -p "$pkgdir/usr/bin"
  binaries="chef-run berks chef chef-apply chef-client chef-shell chef-solo chef-vault cookstyle dco delivery foodcritic inspec kitchen knife ohai push-apply pushy-client pushy-service-manager"
  for binary in $binaries; do
    ln -s "/opt/$pkgname/bin/$binary" "$pkgdir/usr/bin/" || error_exit "Cannot link $binary to /usr/bin"
  done

  chown -Rh 0:0 "$pkgdir"
  chmod -R 755 "$pkgdir/opt"
}
