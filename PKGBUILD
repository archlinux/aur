# Contributor:  jyantis <yantis@yantis.net>
# Contributor: Erik Johnson <palehose at gmail dot com>

_pkgname=fasd
pkgname=${_pkgname}-git
pkgver=1.0.1.r7.g90b531a
pkgrel=1
pkgdesc='Command-line productivity booster, offers quick access to files and directories'
arch=('any')
url='https://github.com/clvv/fasd'
license=('MIT')
source=('git+https://github.com/clvv/fasd.git' 'fasd-git.install')
install="fasd-git.install"
md5sums=('SKIP' '540298da2619dc8ad7e10661b1d701e8')
depends=('bash')
makedepends=('git')
provides=('fasd')
conflicts=('fasd')


pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$_pkgname"

  make DESTDIR="${pkgdir}" PREFIX=/usr install

  # Install License
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  # Install Documentation
  install -D -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

# vim:set ts=2 sw=2 et:
