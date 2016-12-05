# Maintainer: Edgard Castro <castro@edgard.org>

pkgname=schemegen-git
pkgver=r8.9d5a2fb
pkgrel=1
pkgdesc="Color scheme generator and config manager"
arch=('any')
url="https://github.com/NBonaparte/${pkgname%-git}"
license=('GPL3')
depends=('python' 'python-pillow')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  ( set -o pipefail
    git describe --long --tag | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  ) 2>/dev/null
}

package() {
  cd "${srcdir}/${pkgname}"
  python setup.py install --root="${pkgdir}/" --prefix=/usr --optimize=1
}
