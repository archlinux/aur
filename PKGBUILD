# Maintainer: David Manouchehri <manouchehri@riseup.net>

pkgname=bindiff
pkgver=4.2
pkgrel=2
pkgdesc="A comparison tool for binary files that assists vulnerability researchers and engineers to quickly find differences and similarities in disassembled code."
arch=('i686' 'x86_64')
url="http://www.zynamics.com/bindiff.html"
license=('custom')
depends=('desktop-file-utils' 'java-runtime>=8')
options=('!strip')
install=${pkgname}.install
backup=('etc/opt/zynamics/BinDiff/bindiff.xml' 'etc/opt/zynamics/BinDiff/config.xml')
source=("https://dl.google.com/dl/zynamics/bindiff-license-key.zip")
source_i686=("https://dl.google.com/dl/zynamics/bindiff420-debian8-i386.deb")
source_x86_64=("https://dl.google.com/dl/zynamics/bindiff420-debian8-amd64.deb")
sha1sums=("95715a8bd7469106fc60b03f94f3cc87604e354c")
sha1sums_i686=('49cdd6ae7ebe5b1813a5fcafaae9fde19005c824')
sha1sums_x86_64=('38fbea8070495fc8730d7c86eae03bc68fde291f')

package() {
  # Extract
  tar -xJf data.tar.xz --exclude="usr/share/lintian" -C "${pkgdir}"/

  # Install the license key
  install -m 0644 "zynamics BinDiff License Key.txt" "${pkgdir}/opt/zynamics/BinDiff/bin/"

  # Install links to the binaries
  install -dm 755 "${pkgdir}/usr/bin"
  ln -s "/opt/zynamics/BinDiff/bin/bindiff.sh" "${pkgdir}/usr/bin/bindiff"
  ln -s "/opt/zynamics/BinDiff/bin/differ" "${pkgdir}/usr/bin/differ"

  # Install license files
  install -dm 755 "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "/usr/share/doc/${pkgname}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/"
  ln -s "/opt/zynamics/BinDiff/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/"
}

# vim:set et sw=2 sts=2 tw=80:
