# Maintainer: Gergely Imreh <imrehg@gmail.com>
# Contributor: Gergely Imreh <imrehg@gmail.com>

pkgname=resin-cli-git
pkgdesc='Resin.io command line interface, development version'
pkgver=7.10.3.r0.g33a2377
pkgrel=1
arch=('any')
url='https://resin.io/'
license=('APACHE')
depends=('nodejs')
makedepends=('npm' 'git' 'python2')
source=('git+https://github.com/resin-io/resin-cli.git')
provides=('resin-cli')
conflicts=('resin-cli')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/${pkgname%-git}"

  _branch=$(git rev-parse --abbrev-ref HEAD)
  git archive --format=tar --prefix=${pkgname%-git}/ ${_branch} | gzip >"${srcdir}/${pkgname}.tar.gz"

  npm install --global -user root --prefix "${pkgdir}/usr" "$srcdir/${pkgname}.tar.gz"
}
