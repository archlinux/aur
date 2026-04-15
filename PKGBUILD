# Maintainer: Your Name <valentin@barbaza.org>
pkgname=olcli
_npmname=@aloth/olcli
pkgver=0.1.7
pkgrel=1
pkgdesc="Command-line interface to sync, manage, and compile LaTeX projects on Overleaf"
arch=('any')
url="https://github.com/aloth/olcli"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/${_npmname}/-/olcli-${pkgver}.tgz")
sha256sums=('1ebeac4d9ca039e42e40b14311e19caaea6799513546488134caebf331d20db8')

package() {
  # Install the npm package globally into the temporary packaging directory
  npm install -g --prefix "${pkgdir}/usr" --cache "${srcdir}/npm-cache" "${srcdir}/olcli-${pkgver}.tgz"

  # Fix folder permissions and ownership so pacman can manage them cleanly
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +
  chown -R root:root "${pkgdir}"

  # Clean up empty/unnecessary directories created by npm
  rm -rf "${pkgdir}/usr/etc"
}
