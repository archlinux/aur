# Maintainer: xpt <user.xpt@gmail.com>
pkgname=prey-node-client
pkgver=1.4.1
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
sha256sums_x86_64=('83ab1a339a5888a339331d7246fee3c324d5baa938db62e55d0f6ed5144cd59b')
sha256sums_i686=('51bfc0ba1f770fc0517679873450a25a7b7843c537558b0a758b7023e6aa3590')


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
