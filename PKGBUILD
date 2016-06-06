# Maintainer: André Silva <emulatorman@parabola.nu>
# Contributor: Luke Shumaker <lukeshu@sbcglobal.net>

# Based on linux-manpages package

pkgname=linux-libre-manpages
_pkgver=4.6-gnu

_srcname=linux-${_pkgver%-*}
_archpkgver=${_pkgver%-*}
pkgver=${_pkgver//-/_}
pkgrel=1
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
sha256sums=('c3726ad785b2f4534c78a2cff1dd09906dde8b82775e55860a6091b16bf62ef8'
            'SKIP')
validpgpkeys=(
              '474402C8C582DAFBE389C427BCB7CF877E7D47A7' # Alexandre Oliva
)

build() {
  cd "${srcdir}/${_srcname}"
  make mandocs
}

package() {
  cd "${srcdir}/${_srcname}"
  # fix install path
  sed -i -e "s:/usr/local/man/man9/:${pkgdir}/usr/share/man/man9/:g" Documentation/DocBook/Makefile
  make installmandocs

  #install -d "${pkgdir}/usr/share/man/man9/"
  #install "${srcdir}"/linux-$pkgver/Documentation/DocBook/man/*/*.9.gz "${pkgdir}/usr/share/man/man9/"

#  find "${pkgdir}" -type f -exec chmod 644 {} \;
}
