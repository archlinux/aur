# Maintainer: Szilveszter Székely <szekelyszilv at gmail dot com>
pkgname=jutoh
pkgver=3.16
pkgrel=1
pkgdesc="An ebook creation tool"
arch=('x86_64')
url="http://www.jutoh.com"
license=('custom: Jutoh')
depends=('gtk2' 'libpng' 'libsm'
         'desktop-file-utils')
optdepends=('libjpeg6: jpeg support'
            'java-runtime: epubcheck support')

source=('jutoh.sh')
source_x86_64=(http://www.jutoh.com/Jutoh-${pkgver}-x86_64.tar.gz)

sha512sums=('620b4f443129c87dab2a49669d466a2e78979a52a4068e61f2b8f2c318100d2c453261b80250fe78be144c11aa2a41f91a178fb70281ac138727c096e67727fd')
sha512sums_x86_64=('9c622ad129d1cdb52f4da1b721d3f336bb90530b867900a1c769cc1390b55759ae8b39e4125315762f1c8453cc30bfe2e92672274baae5825ff5feca2ec55415')

prepare() {
  mkdir ${srcdir}/jutoh-data
  cd ${srcdir}/jutoh-data
  tar -xzf ${srcdir}/JutohData.tar.gz
}

package() {
  msg2 "Copying executable"
  install -Dm755 ${srcdir}/jutoh.sh ${pkgdir}/usr/bin/jutoh
  install -Dm755 ${srcdir}/jutoh.sh ${pkgdir}/usr/bin/jutoh3

  msg2 "Copying desktop file"
  install -Dm644 ${srcdir}/jutoh-data/jutoh3.desktop \
                 ${pkgdir}/usr/share/applications/jutoh3.desktop
  install -Dm644 ${srcdir}/jutoh-data/x-jutoh3.desktop \
                 ${pkgdir}/usr/share/mimelnk/application/x-jutoh3.desktop

  msg2 "Copying icons"
  for res in '16x16' '24x24' '32x32' '48x48' '64x64' '128x128'; do
    install -Dm644 ${srcdir}/jutoh-data/appicons/jutoh${res}.png \
                   ${pkgdir}/usr/share/icons/hicolor/${res}/apps/jutoh3.png
  done
  for res in '16x16' '24x24' '32x32' '48x48' '64x64' '128x128'; do
    install -Dm644 ${srcdir}/jutoh-data/appicons/jutoh_document${res}.png \
                   ${pkgdir}/usr/share/icons/hicolor/${res}/mimetypes/application-x-jutohproject.png
    install -Dm644 ${srcdir}/jutoh-data/appicons/jutoh_document_script${res}.png \
                   ${pkgdir}/usr/share/icons/hicolor/${res}/mimetypes/application-x-jutohscript.png
  done
  install -Dm644 ${srcdir}/jutoh-data/appicons/jutoh128x128.png \
                 ${pkgdir}/usr/share/pixmaps/jutoh3.png

  msg2 "Copying mimetypes"
  install -Dm644 ${srcdir}/jutoh-data/jutoh3.mime \
                 ${pkgdir}/usr/share/mime-info/jutoh3.mime
  install -Dm644 ${srcdir}/jutoh-data/jutoh3.keys \
                 ${pkgdir}/usr/share/mime-info/jutoh3.keys
  install -Dm644 ${srcdir}/jutoh-data/jutoh3.xml \
                 ${pkgdir}/usr/share/mime/packages/jutoh3.xml
  install -Dm644 ${srcdir}/jutoh-data/jutoh3.applications \
                 ${pkgdir}/usr/share/application-registry/jutoh3.applications

  msg2 "Copying licence"
  install -Dm644 ${srcdir}/jutoh-data/license.txt \
                 ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

  msg2 "Copying files"
  install -dm755 ${pkgdir}/usr/share/jutoh
  cp -R ${srcdir}/jutoh-data/. $pkgdir/usr/share/jutoh

  msg2 "Cleaning up files"
  rm -r ${pkgdir}/usr/share/jutoh/{jutoh3.{applications,desktop,keys,mime,xml},license.txt,x-jutoh3.desktop,appicons}
}
