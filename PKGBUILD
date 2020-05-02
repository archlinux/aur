# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=notepas-gtk2-bin
pkgver=0.9.14
pkgrel=1
pkgdesc="A portable multi-platform text editor"
arch=('x86_64')
url="https://github.com/beNative/notepas"
license=('GPL-3.0')
depends=('gtk2')
makedepends=('gendesk')
provides=('notepas')
options=('!strip')
source=("https://github.com/beNative/Notepas/releases/download/v${pkgver}/notepas-${pkgver}.x86_64-linux-gtk2.zip")
sha256sums=('c09fa3bb4e79b2b45894be3863d0bcc7f3b882424f0e898e58bfd8b305d0ae70')

package() {
  install -Dm755 "${srcdir}/Notepas" -t "${pkgdir}/opt/notepas-gtk2/"
  install -Dm644 "${srcdir}"/notepas*.xml -t "${pkgdir}/opt/notepas-gtk2/"
  install -Dm666 "${srcdir}"/settings.xml -t "${pkgdir}/opt/notepas-gtk2/"
  install -Dm644 "${srcdir}"/*.po -t "${pkgdir}/opt/notepas-gtk2/"
  install -d "${pkgdir}/usr/bin"
  ln -s /opt/notepas-gtk2/Notepas "${pkgdir}/usr/bin/notepas"
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname%-bin}"
  ln -s /usr/share/licenses/common/GPL3/license.txt \
   "${pkgdir}/usr/share/licenses/${pkgname%-bin}/LICENSE"
  gendesk -f -n --pkgname "${pkgname%-bin}" \
          --pkgdesc "$pkgdesc" \
          --name "Notepas" \
          --genericname "Notepas Text Editor" \
          --comment "$pkgdesc" \
          --exec notepas \
          --categories 'Utility;TextEditor;'
  install -Dm644 notepas-gtk2.desktop -t "${pkgdir}/usr/share/applications"
}