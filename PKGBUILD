# Maintainer: Tony Garcia <tony dot garcia at rackspace dot com>

pkgname='recap-git'
pkgdesc="System status reporting"
pkgver=0.9.14.r41.g19ad54d
pkgrel=1
arch=('any')
url="https://github.com/rackerlabs/${pkgname%-*}"
license=('GPL2')
provides=(${pkgname})
conflicts=(${pkgname%-*})
depends=('bash' 'bc' 'coreutils' 'gawk' 'grep' 'iotop' 'procps-ng' 'sysstat'
         'net-tools')
optdepends=('apache: apachectl'
            'lynx: apachectl status')
source=("${pkgname}::git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${pkgname}"
  make DESTDIR="${pkgdir}/" PREFIX=/usr BINPATH=/bin install
  ls -l ${pkgdir}
}
