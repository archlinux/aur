# $Id: PKGBUILD 228946 2015-01-12 18:45:53Z anatolik $
# Maintainer (Arch): Tobias Powalowski <tpowa@archlinux.org>
# Maintainer (Arch): Thomas Baechler <thomas@archlinux.org>
# Maintainer: André Silva <emulatorman@parabola.nu>
# Contributor: Luke Shumaker <lukeshu@sbcglobal.net>

pkgname=linux-libre-manpages
_pkgver=3.18-gnu

_srcname=linux-${_pkgver%-*}
_archpkgver=${_pkgver%-*}
pkgver=${_pkgver//-/_}
pkgrel=1
pkgdesc="Kernel hackers manual - Section 9 manpages that comes with the Linux-libre kernel"
arch=('any')
url="http://linux-libre.fsfla.org/"
license=('GPL2')
makedepends=('xmlto' 'docbook-xsl')
replaces=('kernel26-manpages' 'kernel26-libre-manpages' 'linux-manpages')
conflicts=('kernel26-manpages' 'kernel26-libre-manpages' 'linux-manpages')
provides=('kernel26-manpages' 'kernel26-libre-manpages' "linux-manpages=${_archpkgver}")
source=("http://linux-libre.fsfla.org/pub/linux-libre/releases/${_pkgver}/linux-libre-${_pkgver}.tar.xz")
sha256sums=('0f347d8eba8a6878246b94b3559eb0371d96a3f43de2f134513e274de11a60cf')

build() {
  cd "${srcdir}/${_srcname}"
  make mandocs
}

package() {
  install -d "${pkgdir}/usr/share/man/man9/"
  install "${srcdir}"/${_srcname}/Documentation/DocBook/man/*.9.gz \
    "${pkgdir}/usr/share/man/man9/"

  find "${pkgdir}" -type f -exec chmod 644 {} \;
}
