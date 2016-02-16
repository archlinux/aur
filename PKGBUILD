# Maintainer: André Silva <emulatorman@parabola.nu>
# Contributor: Luke Shumaker <lukeshu@sbcglobal.net>

# Based on linux-manpages package

pkgname=linux-libre-manpages
_pkgver=4.4-gnu

_srcname=linux-${_pkgver%-*}
_archpkgver=${_pkgver%-*}
pkgver=${_pkgver//-/_}
pkgrel=2
pkgdesc="Kernel hackers manual - Section 9 manpages that comes with the Linux-libre kernel"
arch=('any')
url="http://linux-libre.fsfla.org/"
license=('GPL2')
makedepends=('xmlto' 'docbook-xsl')
replaces=('linux-manpages')
conflicts=('linux-manpages')
provides=("linux-manpages=${_archpkgver}")
source=("http://linux-libre.fsfla.org/pub/linux-libre/releases/${_pkgver}/linux-libre-${_pkgver}.tar.xz"
        "http://linux-libre.fsfla.org/pub/linux-libre/releases/${_pkgver}/linux-libre-${_pkgver}.tar.xz.sign")
sha256sums=('f53e99866c751f21412737d1f06b0721e207f495c8c64f97dffb681795ee69a0'
            'SKIP')
validpgpkeys=(
              '474402C8C582DAFBE389C427BCB7CF877E7D47A7' # Alexandre Oliva
)

build() {
  cd "${srcdir}/${_srcname}"
  make mandocs
}

package() {
  install -d "${pkgdir}/usr/share/man/man9/"
  find "${srcdir}"/${_srcname}/Documentation/DocBook/man -type f -name *.9.gz -exec install {} "${pkgdir}/usr/share/man/man9/" \;
  find "${pkgdir}" -type f -exec chmod 644 {} \;
}
