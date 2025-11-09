# Maintainer : silverhikari <kerrickethan at gmail dot com>
# Contributor: epitron <chris at ill-logic dot com>
# Contributor: kfgz <kfgz at interia dot pl>
# Contributor: Abakus <java5 at arcor dot de>
# Contributor: watashi <zejun dot wu at gmail dot com>

pkgname=afflib
pkgver=3.7.22
pkgrel=1
pkgdesc="An extensible open format for the storage of disk images and related forensic information"
arch=('i686' 'x86_64')
url="https://github.com/sshock/AFFLIBv3/"
license=('custom')
depends=('zlib' 'openssl' 'fuse' 'readline' 'gcc-libs' 'libmd' 'expat' 'curl')
source=("https://github.com/sshock/AFFLIBv3/archive/v${pkgver}.tar.gz")
sha256sums=('67481fc520ff927bf61aea0bf2d660feb73e24cc329335bebb064f8f12115dcb')

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
