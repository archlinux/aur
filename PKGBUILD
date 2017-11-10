# Maintainer: David Manouchehri <manouchehri@riseup.net>

pkgname=bindiff
pkgver=4.3
pkgrel=1
pkgdesc="A comparison tool for binary files that assists vulnerability researchers and engineers to quickly find differences and similarities in disassembled code."
arch=('x86_64')
url="https://www.zynamics.com/bindiff.html"
license=('custom')
depends=('desktop-file-utils' 'java-runtime>=8')
options=('!strip')
install=${pkgname}.install
backup=('etc/opt/zynamics/BinDiff/bindiff_core.xml'
'etc/opt/zynamics/BinDiff/bindiff_ui.xml')
source=("https://dl.google.com/dl/zynamics/bindiff_4.3.0_amd64.deb")
sha256sums=('98776bd9a61a29e4c8518b0ff0ae0a66518ab7c759aead5e3fcf2e6d3bcd1987')

package() {
  # Extract
  tar -xJf data.tar.xz --exclude="usr/share/lintian" -C "${pkgdir}"/

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
