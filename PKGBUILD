# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com
# Maintainer: onefire <onefire.myself@gmail.com>
#Contributor: Ewoud Nuyts <ewoud.nuyts@gmail.com>
#Contributor: Timothy Redaelli <timothy.redaelli@gmail.com>

pkgname='shc'
pkgver='3.8.9'
pkgrel='2'
pkgdesc='Converts shell script to C source code, and then compiles it. Do NOT use this to encrypt your scripts as it is not meant to be used for that.'
arch=('any')
url='http://www.datsi.fi.upm.es/~frosal/sources/shc.html'
provides=('shc')
license=('GPL')
source=("http://www.datsi.fi.upm.es/~frosal/sources/${pkgname}-${pkgver}.tgz")
sha256sums=('60f3220db9440322e8eddeea82501035931193e8570983e73b0519b6317ffe4a')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  #makefile assumes this symbolic link exists in version 3.8.9
  if [ ! -f "${pkgname}.c" ]; then
    msg "Created symbolic link ${srcdir}/${pkgname}-${pkgver}/${pkgname}.c"
    ln -sf "${pkgname}-${pkgver}.c" "${pkgname}.c"
  fi
  make "${pkgname}"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/shc"
  #Install the man page (makepkg automatically gzips man pages)
  #gzip "${pkgname}.1
  install -Dm644 "${pkgname}.1" "$pkgdir/usr/share/man/man1/${pkgname}.1"
}
