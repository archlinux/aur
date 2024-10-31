# adopted from aur3 mirror
#
# Contributor: Adrian C. (anrxc) <anrxc..sysphere.org>
# Contributor: Jose Riha jose1711 gmail com
# Maintainer: Lee Chong Yew ramchyld -at- gmail -dot- com

pkgname=topal
pkgver=84
pkgrel=1
pkgdesc="Topal is a glue program that links GnuPG and Alpine"
arch=("i686" "x86_64")
url="https://zircon.org.uk/topal/"
license=("GPL3")
makedepends=("gcc-ada" "make" "lynx" "git")
optdepends=("alpine: for which topal was mainly written for"
            "re-alpine: fork of alpine for which topal was mainly written for"
            "gnupg: to encrypt, decrypt, sign and verify e-mail"
            "metamail: to display and process MIME messages"
            "mime-support: its run-mailcap tool as alternative to metamail"
            "openssh: for remote and server mode of operation")
install="${pkgname}.install"
options=("!makeflags")
source=('git+https://dl.green-pike.co.uk/topal.git')
md5sums=('SKIP')


build() {
  cd "${pkgname}"

# Remove PDF build stuff
  sed -i 's/binary topal.pdf/binary/' Makefile

# Build Topal and MIME-tool
  make distclean
  make
}

package() {
  cd "${pkgname}"

# Install Topal binary, manual page and documentation
  install -D -m755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -D -m644 "${pkgname}.man" "${pkgdir}/usr/share/man/man1/${pkgname}.1"
# Replaced by some PDF stuff which we will not build
  #install -D -m644 README.txt "${pkgdir}/usr/share/doc/${pkgname}/README"

# Install Topal's version of MIME-tool and manual page
  install -D -m755 MIME-tool/mime-tool "${pkgdir}/usr/bin/mime-tool"
  install -D -m644 MIME-tool/mime-tool.man "${pkgdir}/usr/share/man/man1/mime-tool.1"
}
