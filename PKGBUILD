# Maintainer: Andre Schröder <andre.schroedr at gmail dot com>

# All my PKGBUILDs are managed at https://github.com/schra/pkgbuilds

pkgname=bats-core
pkgver=1.1.0
pkgrel=3
pkgdesc='Bash Automated Testing System'
arch=('any')
url='https://github.com/bats-core/bats-core'
license=('MIT')
depends=('bash')
makedepends=('git')
source=("$url/archive/v$pkgver.tar.gz" fix-libexec-path.patch)
sha256sums=('855d8b8bed466bc505e61123d12885500ef6fcdb317ace1b668087364717ea82'
            '1c1aa78cead376910f71807d4615e3041c91e4525c9a439defc90e1d5f776c2a')
conflicts=(bash-bats)
provides=(bash-bats)

check() {
  cd "${srcdir}/bats-core"
  bin/bats --tap test
}

package() {
  cd "${srcdir}/bats-core"

  patch -p1 -i "${srcdir}/fix-libexec-path.patch"

  install -dm755 "${pkgdir}"/{usr/bin,usr/lib/bats,usr/share/man/man{1,7},usr/share/licenses/${pkgname}}
  install -m 755 "bin"/* "${pkgdir}/usr/bin"
  install -m 755 "libexec/bats-core"/* "${pkgdir}/usr/lib/bats"
  install -m 644 "man/bats.1" "${pkgdir}/usr/share/man/man1"
  install -m 644 "man/bats.7" "${pkgdir}/usr/share/man/man7"
  install -m 644 LICENSE.md "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE.md
}
