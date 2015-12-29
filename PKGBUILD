# Maintainer: xpt <user.xpt@gmail.com>
pkgname=prey-node-client
pkgver=1.5.0
pkgrel=1
pkgdesc="Remote tracking and monitoring application for laptops, smartphones, and other electronic devices"
url="https://preyproject.com/"
arch=('x86_64' 'i686')
license=('GPLv3')
depends=('nodejs' 'mpg123' 'xawtv' 'scrot' 'openssh' 'wireless_tools' 'lsb-release' 'python2' 'pygtk' 'networkmanager')
replaces=('prey-tracker')
# Should be used as soon as the bash client is renamed
#provides=('prey-tracker')
install='prey-node-client.install'
source=('prey-node-client.patch')
source_x86_64=("https://s3.amazonaws.com/prey-releases/node-client/${pkgver}/prey-linux-${pkgver}-x64.zip")
source_i686=("https://s3.amazonaws.com/prey-releases/node-client/${pkgver}/prey-linux-${pkgver}-x86.zip")
sha256sums=('1b296df026b6f2fd4278e4457e20e305122c69f524dfa39ed5e4e559de536252')
sha256sums_x86_64='aa62e9bf1af2f7f9176f2024704969d84ddbe9471b3a53e35d96a0daa3f5deb4'
sha256sums_i686='1e73f7d838fb654c0f45d6124152d7f49c18649b280a879fc33be09807530361'


package() {
  cd "${srcdir}/prey-${pkgver}"

  # We don't need the bundled node.js as we have it installed in the system.
  # Conveniently, the bash script probes for node.js and automatically uses
  # the system node if the bundled one is not found.
  rm bin/node

  # Fix symlink path, Python shebangs and default-disable automatic updates
  patch -p0 < ${srcdir}/prey-node-client.patch

  mkdir -p "$pkgdir/opt/prey-node-client/"
  cp -r ./* "$pkgdir/opt/prey-node-client/"
  install -Dm644 license.txt "$pkgdir/usr/share/licenses/$pkgname/license.txt"

  mkdir -p "$pkgdir/usr/bin/"
  ln -s /opt/prey-node-client/bin/prey "$pkgdir/usr/bin/prey"
}

# vim:set ts=2 sw=2 et: 
