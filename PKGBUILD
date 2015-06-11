# Maintainer:  jyantis <yantis@yantis.net>
# Contributor: Erik Johnson <palehose at gmail dot com>

pkgname=fasd-git
pkgver=1.0.1.r300.61ce53b
pkgrel=2
pkgdesc='Command-line productivity booster, offers quick access to files and directories'
arch=('any')
url='https://github.com/Neki/fasd'
license=('MIT')
source=('git+https://github.com/clvv/fasd.git' 'fasd-git.install')
install="fasd-git.install"
md5sums=('SKIP' '540298da2619dc8ad7e10661b1d701e8')
depends=('bash')
makedepends=('git')
provides=('fasd')
conflicts=('fasd')
epoch=1

pkgver() {
  cd fasd
  _version=$(grep -F version fasd | awk -F\" '{print $4}')
  printf "%s.r%s.%s" "${_version}"  "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd fasd

  # We don't need anything related to git in the package
  rm -rf .git*

  # Install License
  # MIT/X11 license
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install Documentation
  install -D -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  make DESTDIR="${pkgdir}" PREFIX=/usr install
}

# vim:set ts=2 sw=2 et:
