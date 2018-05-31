# Maintainer: Gergely Imreh <imrehg@gmail.com>
# Contributor: Gergely Imreh <imrehg@gmail.com>

pkgname=resin-cli-git
pkgdesc='Resin.io command line interface, development version'
pkgver=7.4.1.r0.g7bea2c2
pkgrel=1
arch=('any')
url='https://resin.io/'
license=('APACHE')
depends=('nodejs')
makedepends=('npm' 'git')
source=('git+https://github.com/resin-io/resin-cli.git')
provides=('resin-cli')
conflicts=('resin-cli')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/${pkgname%-git}"
  git archive --format=tar --prefix=${pkgname%-git}/ master | gzip >"${srcdir}/${pkgname}.tar.gz"
}

package() {
  npm install --global -user root --prefix "${pkgdir}/usr" "$srcdir/${pkgname}.tar.gz"
}
