# Maintainer : silverhikari
# Contributor: epitron <chris at ill-logic dot com>
# Contributor: kfgz <kfgz at interia dot pl>
# Contributor: Abakus <java5 at arcor dot de>
# Contributor: watashi <zejun dot wu at gmail dot com>

pkgname=afflib
pkgver=3.7.20
pkgrel=1
pkgdesc="An extensible open format for the storage of disk images and related forensic information"
arch=('i686' 'x86_64')
url="https://github.com/sshock/AFFLIBv3/"
license=('custom')
depends=('zlib' 'openssl' 'fuse' 'readline' 'gcc-libs' 'libmd' 'expat' 'curl')
source=("https://github.com/sshock/AFFLIBv3/archive/v${pkgver}.tar.gz")
sha256sums=('7264d705ff53185f0847c69abdfce072779c0b907257e087a6372c7608108f65')

build() {
  cd "${srcdir}"/AFFLIBv3-${pkgver}
  sh bootstrap.sh
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd "${srcdir}"/AFFLIBv3-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -Dm755 "COPYING" "${pkgdir}/usr/share/licenses/afflib/LICENSE"
}
