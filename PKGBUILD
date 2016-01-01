# Maintainer: David Manouchehri <manouchehri@riseup.net>

pkgname="bindiff"
pkgver=4.2
pkgrel=1
pkgdesc="A comparison tool for binary files, that assists vulnerability researchers and engineers to quickly find differences and similarities in disassembled code."
url="http://www.zynamics.com/bindiff.html"
license=('unknown')
source=("https://dl.google.com/dl/zynamics/bindiff420-debian8-amd64.deb"
        "https://dl.google.com/dl/zynamics/bindiff-license-key.zip")
# https://dl.google.com/dl/zynamics/bindiff420-debian8-i386.deb
sha512sums=('18f20c1a5f9fe2c305e89f960b42b21107d03775a86ba1a50f02a7bf0217dd9793ffb91c55b5f83cbb398ebb678f61a7ca7c6d9cfbd721a9482af700ea96746a'
            'e07258362f04d250c6f00c4ca3c6e92fc2b014c63a9ad8b36d813591053c64118283724a594fbae3a4517cba112a952bcc7ab4557cd1e14ab711076fd70bcc7e')
arch=('x86_64') # arch=('i686' 'x86_64')
depends=('java-runtime')

package() {
  cd "${srcdir}/"
  tar -xvf 'data.tar.xz' -C "${pkgdir}/"

  install -m 0444 'zynamics BinDiff License Key.txt' "${pkgdir}/opt/zynamics/BinDiff/bin/"

  mkdir -p "${pkgdir}/usr/bin/"
  ln -s "/opt/zynamics/BinDiff/bin/bindiff.sh" "${pkgdir}/usr/bin/bindiff"

  printf "\033[31;1mYou will need to fetch the IDA plugins.\n"
  printf "https://dl.google.com/dl/zynamics/bindiff420-win-pluginsonly.zip\n"
}

# vim:set et sw=2 sts=2 tw=80: