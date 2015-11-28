# Maintainer: jdarch <jda -dot- cloud -plus- archlinux -at- gmail -dot- com>
# Contributors: bepebe, cconrad
# Parts adapted from: Muflone/freeoffice@aur

pkgname=softmaker-office-2016-bin
pkgver=2016.748
pkgrel=2
pkgdesc="Softmaker Office 2016, proprietary office suite; word processing, spreadsheets, presentations"
url="http://softmaker.com"
arch=('x86_64' 'i686')
license=('custom')
install=smoffice2016.install

depends=('desktop-file-utils' 'shared-mime-info' 'hicolor-icon-theme')
depends_i686=('libxmu' 'libidn' 'libgl' 'libxrandr')
depends_x86_64=('lib32-libxmu' 'lib32-libidn' 'lib32-libgl' 'lib32-libxrandr')

source=("http://www.softmaker.net/down/softmaker-office-${pkgver//./-}.tgz"
        "planmaker16"
        "presentations16"
        "textmaker16"
        "planmaker-2016.desktop"
        "presentations-2016.desktop"
        "textmaker-2016.desktop")
md5sums=('dfafef9fc0b03e29148a3ebded2e42f2'
         '5e698160b69670b71ca1306457e95fe0'
         '9853d3b98ec799d16bf86617401b40fa'
         '1f17766bb95adc0bc56a8b683ff888f6'
         '170313c9a4d692a78cd38b0e46b71a7b'
         '86b058133c52201abd98a2594849e77e'
         'b0cb162e83fb4f186b1fb458f12ddc00')
sha512sums=('5f7923d60da08bbeb1394068ff2aa8daa17cf5ef9862a51ccfabbfdf8a65083bfe3e67c35b2ce02e1828abaab5fcb5cc48468387d35238ddaff60fd25cafa814'
            '47e08e91734692b77d17999ce32b974a7f3cede5082f0884b2d1546d6ce7204bfcf67d713de9148398834aca28626d033855703fa3e0e375879fb085a89a2251'
            'd48d6b4e4350b1b47935a8fadef7be113e7718dbdb9d956df6325009f95a17711f075f8b154f3931c0880f2bff566f49ae989c3f5b0de9f956852e9d447c9034'
            '96fc1950a23eb2faed83ddd317540d9ecc9fa46989dabe7325f0107eea1544ffa88adaf53f58fd050805c343b5fe9d698bc194cada9535411a64a4833f51fa10'
            '395786d38202e03fc6c06502200731ccc05d066c0467caa56e5ff7573933f3f5591da805d21919cbc0a7ec61cc0f7d95b37a49bc0c6ff0480ba26197f0d2abfb'
            'd347cb1bd87273b87e283a64ea7d78265dbb524f18f783840cb7d560e402acfc4cba1e6d7fb5fae83314c70fea1d47334f9615592021513fd6e3b8ce7550cdeb'
            '94224fb084136441c1855e86247f6882017eab4648928e1bbbc4691b1b50f41b29a0945ab4056c774d1fc0dfb0edcddb6fffea758023de71877f62b1c545289c')

package() {
  mkdir -p "${pkgdir}/opt/smoffice2016"
  tar -xzf "${srcdir}/office.tgz" -C "${pkgdir}/opt/smoffice2016"

  ln -s "/opt/smoffice2016/usr/lib/dpf/libdle.so.1" "${pkgdir}/opt/smoffice2016/usr/lib/libdle.so.1"
  ln -s "/opt/smoffice2016/usr/lib/dpf/libdpf.so.2.8.0" "${pkgdir}/opt/smoffice2016/usr/lib/libdpf.so.2"
  ln -s "/opt/smoffice2016/usr/lib/dpf/libsx.so" "${pkgdir}/opt/smoffice2016/usr/lib/libsx.so"

  install -d "${pkgdir}/usr/bin"
  install -m 755 -t "${pkgdir}/usr/bin" "${srcdir}/planmaker16"
  install -m 755 -t "${pkgdir}/usr/bin" "${srcdir}/presentations16"
  install -m 755 -t "${pkgdir}/usr/bin" "${srcdir}/textmaker16"
  for size in 16 32 48 64 128
    do
      install -d "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps"
      ln -s "/opt/smoffice2016/icons/pml_${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/smoffice2016-planmaker.png"
      ln -s "/opt/smoffice2016/icons/prl_${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/smoffice2016-presentations.png"
      ln -s "/opt/smoffice2016/icons/tml_${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/smoffice2016-textmaker.png"

      install -d "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/mimetypes"
      ln -s "/opt/smoffice2016/icons/pmd_${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/mimetypes/application-x-pmd.png"
      ln -s "/opt/smoffice2016/icons/prd_${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/mimetypes/application-x-prd.png"
      ln -s "/opt/smoffice2016/icons/tmd_${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/mimetypes/application-x-tmd.png"
    done

install -d "${pkgdir}/usr/share/mime/packages"
install -m 644 -t "${pkgdir}/usr/share/mime/packages" "${pkgdir}/opt/smoffice2016/mime/softmaker-office-2016.xml"

install -d "${pkgdir}/usr/share/applications"
install -m 644 -t "${pkgdir}/usr/share/applications" "${srcdir}/planmaker-2016.desktop"
install -m 644 -t "${pkgdir}/usr/share/applications" "${srcdir}/presentations-2016.desktop"
install -m 644 -t "${pkgdir}/usr/share/applications" "${srcdir}/textmaker-2016.desktop"
}
