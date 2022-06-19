# Maintainer: xpt <user.xpt@gmail.com>
# Contributor: Serge K <serge.arch@zmail.pro>

pkgname=prey-node-client
pkgver=1.10.7
pkgrel=1
pkgdesc="Remote tracking and monitoring application for laptops, smartphones, and other electronic devices"
url="https://preyproject.com/"
arch=('x86_64' 'i686')
license=('GPL3')
depends=('nodejs' 'mpg123' 'xawtv' 'scrot' 'openssh' 'wireless_tools' 'lsb-release' 'python2' 'networkmanager' 'npm')
optdepends=('gtk3')
replaces=('prey-tracker')
# Should be used as soon as the bash client is renamed
#provides=('prey-tracker')
install='prey-node-client.install'
source=('prey-node-client.patch' 'prey_project')
source_x86_64=("https://downloads.preyproject.com/prey-client-releases/node-client/$pkgver/prey-linux-$pkgver-x64.zip")
source_i686=("https://downloads.preyproject.com/prey-client-releases/node-client/$pkgver/prey-linux-$pkgver-x86.zip")
sha256sums=('bfe1cd56443eb3e4dd49974e955ffe8ad33b5a7ec749e53cc2682bde82dceb80'
            '41f29d334e7671b07cfdc848b2752ccc51710471285e8ebe61c07faa0d36160d')
sha256sums_x86_64=('54c93fadaadf089898e5115d466aa7366ad49eff72327ac6e874b3523a04b976')
sha256sums_i686=('15766a2e820281970ce1f5eed3d46a304726bd03c3d693511fa81cfba1f63cb7')

package() {
  cd "$srcdir/prey-$pkgver"

  # Now, we use prey's node, so we don't delete bin/node
  # --------------------------------
  # We don't need the bundled node.js as we have it installed in the system.
  # Conveniently, the bash script probes for node.js and automatically uses
  # the system node if the bundled one is not found.
  # rm bin/node

  # Fix symlink path, Python shebangs and default-disable automatic updates
  patch -p0 < ${srcdir}/prey-node-client.patch

  mkdir -p "$pkgdir/opt/prey-node-client/"
  cp -r ./* "$pkgdir/opt/prey-node-client/"
  install -Dm644 license.txt "$pkgdir/usr/share/licenses/$pkgname/license.txt"

  mkdir -p "$pkgdir/usr/bin/"
  # Binary prey named as prey_project
  # ln -s /opt/prey-node-client/bin/prey "$pkgdir/usr/bin/prey_project"
  cp "$srcdir/prey_project" "$pkgdir/usr/bin/prey_project"
}

# vim:set ts=2 sw=2 et: 
