# Maintainer: Tomasz Maciej Nowak <com[dot]gmail[at]tmn505>
# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Gavin Lloyd <gavinhungry@gmail.com>

# All my PKGBUILDs are managed at https://github.com/tmn505/AUR

pkgname=platformflashtoollite
pkgver=5.8.9.0
pkgrel=2
pkgdesc='Flashes firmware and OS images onto Intel-based devices'
arch=('x86_64')
url='https://01.org/projectceladon'
license=('custom')
depends=('libudev0-shim' 'libusb-compat')
source=("https://github.com/projectceladon/tools/raw/master/platform_flash_tool_lite/latest/${pkgname}_${pkgver}_linux_x86_64.rpm")
sha256sums=('7105119c33e61e68377410ee83f68385a951a37db5266fb30ba73be3ef6f785b')

package() {
  sed -e 's,Application;,Qt;Development;,' -i "usr/share/applications/${pkgname}.desktop"

  for i in {etc,opt,usr}
  do
    cp -dpr --no-preserve=ownership $i "${pkgdir}"
  done

  install -d -m 755 "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "/opt/intel/${pkgname}/Licenses/Intel_Development_Tools_Limited_License_Agreement.txt" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
