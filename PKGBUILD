# Maintainer: Alexander Görtz <aur@nyloc.de>

pkgname=yourls-plugin-random-keywords-git
pkgver=0.0
pkgrel=1
pkgdesc="Assign random keywords to shorturls, like bitly."
arch=('any')
url="https://github.com/YOURLS/random-keywords"
license=('MIT')
depends=('yourls')
makedepends=('git')
source=("${pkgname}"::"git+https://github.com/YOURLS/random-keywords.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd "${srcdir}/${pkgname}"
  install -D plugin.php "${pkgdir}/usr/share/webapps/yourls/user/plugins/random-keywords/plugin.php"
}
