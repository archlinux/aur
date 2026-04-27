# Maintainer: Your Name <valentin@barbaza.org>
pkgname=olcli
_npmname=@aloth/olcli
pkgver=0.3.0
pkgrel=1
pkgdesc="Command-line interface to sync, manage, and compile LaTeX projects on Overleaf"
arch=('any')
url="https://github.com/aloth/olcli"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/${_npmname}/-/olcli-${pkgver}.tgz")
sha256sums=('d0a3c7d4254a4bc766394955ce3ecffbd71f9e3288e8d5bee420f7e728b8eddb')

package() {
  # Install the npm package globally into the temporary packaging directory
  npm install -g --prefix "${pkgdir}/usr" --cache "${srcdir}/npm-cache" "${srcdir}/olcli-${pkgver}.tgz"

  # Fix folder permissions and ownership so pacman can manage them cleanly
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +
  chown -R root:root "${pkgdir}"

  # Clean up empty/unnecessary directories created by npm
  rm -rf "${pkgdir}/usr/etc"
}
