# $Id: PKGBUILD 78820 2012-10-25 06:47:28Z foutrelis $
# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Bartłomiej Piotrowski <barthalion@gmail.com>
# Contributor: LaraCraft304 <lara@craft.net.br>
# Contributor: Daniel Micay <danielmicay@gmail.com>
# Contributor: stonecrest <stonecrestATgmailDOTcom>

set -u
pkgname='mingetty'
pkgver='1.08'
pkgrel='4'
pkgdesc='A minimal getty which allows automatic logins.'
arch=('i686' 'x86_64')
url='http://sourceforge.net/projects/mingetty'
license=('GPL')
depends=('glibc')
source=("http://downloads.sourceforge.net/sourceforge/mingetty/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}-utf8.patch")
sha256sums=('0f55c90ba4faa913d91ef99cbf5cb2eb4dbe2780314c3bb17953f849c8cddd17'
            '0a97f54bb071771101ba6187cfabd2a572d3a344165279b858419b97c38057a6')

prepare() {
  set -u
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch "${pkgname}.c" "${srcdir}/${pkgname}-utf8.patch"
  set +u
}

build() {
  set -u
  cd "${srcdir}/${pkgname}-${pkgver}"
  make -s
  set +u
}

package() {
  set -u
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dpm755 "${pkgname}" -t "${pkgdir}/usr/bin/"
  install -Dpm644 "${pkgname}.8" -t "${pkgdir}/usr/share/man/man8/"
  set +u
}
set +u
