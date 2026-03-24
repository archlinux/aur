# Maintainer: Your Name <valentin@barbaza.org>
pkgname=olcli
_npmname=@aloth/olcli
pkgver=0.1.6
pkgrel=1
pkgdesc="Command-line interface to sync, manage, and compile LaTeX projects on Overleaf"
arch=('any')
url="https://github.com/aloth/olcli"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/${_npmname}/-/olcli-${pkgver}.tgz")
sha256sums=('018b859a3c222eacc21e2ad7e8f73cd8cc08496e647a241e774c15e58e788591')

package() {
  # Install the npm package globally into the temporary packaging directory
  npm install -g --prefix "${pkgdir}/usr" --cache "${srcdir}/npm-cache" "${srcdir}/olcli-${pkgver}.tgz"

  # Fix folder permissions and ownership so pacman can manage them cleanly
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +
  chown -R root:root "${pkgdir}"

  # Clean up empty/unnecessary directories created by npm
  rm -rf "${pkgdir}/usr/etc"
}
