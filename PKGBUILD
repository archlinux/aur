# Maintainer: olddog <jeff@impcode.com>

pkgname=postgresql-scram256-password-generator
_realname=postgresql-scram256-password-generator
pkgver=1.0
pkgrel=1
pkgdesc="A program to generate password hashes using SCRAM-SHA-256 for PostgreSQL 10 (and above)."
arch=('x86_64')
url="https://github.com/DenisMedeirosBBD/PostgresSCRAM256PasswordGenerator"
license=('GPL2')
depends=('postgresql-libs')
makedepends=('autoconf' 'automake')
provides=('pg-password-generator')

source=(
  "https://github.com/DenisMedeirosBBD/PostgresSCRAM256PasswordGenerator/archive/${pkgver}.tar.gz"
)

md5sums=('04926346bcd623a1a6d8f0ef22ec2693')

prepare()
{
  cd "${srcdir}/PostgresSCRAM256PasswordGenerator-${pkgver}"
  autoreconf -iv
  ./configure --prefix="${pkgdir}/usr/bin"
}

build()
{
  cd "${srcdir}/PostgresSCRAM256PasswordGenerator-${pkgver}"
  make
}

package()
{
  # install documentation
  cd "${srcdir}/PostgresSCRAM256PasswordGenerator-${pkgver}"
  install -Dm 0644 AUTHORS -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 0644 ChangeLog -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 0644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"

  # install LICENSE file
  install -Dm 0644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"

  # install binary file
  make install
}
