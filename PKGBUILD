# Maintainer: helix <stargr[at]gmail[dot]com>
pkgname=libreoffice-extension-libregreek
pkgver=1.0
pkgrel=5
pkgdesc='An advanced Greek & English dictionary for LibreOffice'
arch=('any')
url='https://github.com/squibbylinux/LibreGreek'
license=('BSD-3')
depends=('libreoffice')
groups=('libreoffice-extensions')
conflicts=('languagetool')
source=(https://github.com/squibbylinux/LibreGreek/archive/master.tar.gz)
sha512sums=('473976031069a7518e2eaf8cfc899dbc022039c819dcf13186a588bddd9e064c0d89429db4f4774c7540c57262d8451ed67594550b83532eeb47661b9444c311')

build() {
  cd ${srcdir}/LibreGreek-master/makedict
  make
  cp elen.dic ${srcdir}/LibreGreek-master/libregreek/dicts/
}

package() {
  install -d ${pkgdir}/usr/lib/libreoffice/share/extensions/libregreek
  for templateDir in dicts help META-INF templates;do
      install -dm775 ${pkgdir}/usr/lib/libreoffice/share/extensions/libregreek/${templateDir}
      if [ ${templateDir} = "templates" ];then
          install -d ${pkgdir}/usr/lib/libreoffice/share/extensions/libregreek/templates/el-GR
          for templateType in Drawing Presentation Writer;do
              install -dm775 ${pkgdir}/usr/lib/libreoffice/share/extensions/libregreek/templates/el-GR/${templateType}
              install -Dm644 ${srcdir}/LibreGreek-master/libregreek/templates/el-GR/${templateType}/* ${pkgdir}/usr/lib/libreoffice/share/extensions/libregreek/templates/el-GR/${templateType}
          done
          rm -rf ${srcdir}/LibreGreek-master/libregreek/templates
      else
          install -Dm644 ${srcdir}/LibreGreek-master/libregreek/${templateDir}/* ${pkgdir}/usr/lib/libreoffice/share/extensions/libregreek/${templateDir}
          rm -rf ${srcdir}/LibreGreek-master/libregreek/${templateDir}
      fi
  done
  install -Dm644 ${srcdir}/LibreGreek-master/libregreek/* ${pkgdir}/usr/lib/libreoffice/share/extensions/libregreek
}
