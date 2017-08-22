# Submitter: Fabien Devaux <fdev31@gmail.com>
# Maintainer: bartus szczepaniak <aur@bartus.33mail.com>

name=retopoflow
pkgname=blender-plugin-${name}-git
pkgver=1.3.1.r0.g9fc2227
pkgrel=1
pkgdesc="A suite of retopology tools for Blender"
arch=('any')
url="https://cgcookiemarkets.com/all-products/retopoflow/"
license=('GPL')
depends=('blender')
makedepends=('git')
conflicts=('blender-plugin-retopoflow')
source=("git+https://github.com/CGCookie/retopoflow.git")
md5sums=('SKIP')

pkgver() {
  cd ${name}
  # cutting off 'v' prefix that presents in the git tag
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd ${srcdir}
  addons="$pkgdir/usr/share/blender/$(blender -v | head -n1 | cut -f2 -d ' ')/scripts/addons"
  install -dm755 ${addons}/${name}
  cp -r ${name}/* ${addons}/${name}
}

# vim:set ts=2 sw=2 et:
