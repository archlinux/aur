# adopted from aur3 mirror
#
# Contributor: Adrian C. (anrxc) <anrxc..sysphere.org>
# Maintainer: Jose Riha jose1711 gmail com

pkgname=topal
pkgver=76
pkgrel=1
pkgdesc="Topal is a glue program that links GnuPG and Alpine"
arch=("i686" "x86_64")
#url="http://homepage.ntlworld.com/phil.brooke/topal"
license=("GPL3")
makedepends=("gcc-ada" "make" "lynx")
optdepends=("alpine: for which topal was mainly written for"
            "re-alpine: fork of alpine for which topal was mainly written for"
            "gnupg: to encrypt, decrypt, sign and verify e-mail"
            "metamail: to display and process MIME messages"
            "mime-support: its run-mailcap tool as alternative to metamail"
            "openssh: for remote and server mode of operation")
install="${pkgname}.install"
options=("!makeflags")
source=("https://fossies.org/linux/privat/topal-package-${pkgver}.tgz")
md5sums=('afe0010716bcb0073d31b3328c7b65ae')


build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

# Remove PDF build stuff
  sed -i 's/binary topal.pdf/binary/' Makefile

# Build Topal and MIME-tool
  make distclean
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

# Install Topal binary, manual page and documentation
  install -D -m755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -D -m644 "${pkgname}.man" "${pkgdir}/usr/share/man/man1/${pkgname}.1"
# Replaced by some PDF stuff which we will not build
  #install -D -m644 README.txt "${pkgdir}/usr/share/doc/${pkgname}/README"

# Install Topal's version of MIME-tool and manual page
  install -D -m755 MIME-tool/mime-tool "${pkgdir}/usr/bin/mime-tool"
  install -D -m644 MIME-tool/mime-tool.man "${pkgdir}/usr/share/man/man1/mime-tool.1"
}
