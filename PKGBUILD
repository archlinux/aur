# Maintainer: yuhr <sdn.pate(at)gmail.com>

pkgname=zpdic
pkgver=1.23.0
pkgrel=1
pkgdesc="A modern solution for dictionary editing."
url="http://ziphil.web.fc2.com/application/download/2.html"
license=('custom')
arch=('any')
conflicts=('zpdic')
provides=('zpdic')
depends=('java-environment>=8' 'java-openjfx>=8' 'sh')
source=("v${pkgver}-full.zip::https://www.dropbox.com/sh/g75rqn97sdlpp0b/AAABh6ecTZmUDZw7666UH-n4a/older/v1.23.0-full.zip?dl=1"
        'zpdic'
        'LICENSE'
        'ZpDIC.desktop')
noextract=("v${pkgver}-full.zip")
md5sums=('92f6727765c333283063f53b44aecd19'
         SKIP
         SKIP
         SKIP)

package() {
  install -Dm755 {,"${pkgdir}/usr/bin/"}zpdic
  install -Dm644 {,"${pkgdir}/usr/share/licenses/${pkgname}/"}LICENSE
  install -Dm755 {,"${pkgdir}/usr/share/applications/"}ZpDIC.desktop

  unzip "v${pkgver}-full.zip" -d "v${pkgver}-full"
  cd "v${pkgver}-full"
  install -dm777 "${pkgdir}/opt/${pkgname}"
  for path in `find` ; do
    if [ -d "${path}" ] ; then
      install -dm777 "${pkgdir}/opt/${pkgname}/${path}"
    elif [ -f "${path}" ] ; then
      install -m644 {,"${pkgdir}/opt/${pkgname}/"}"${path}"
    fi
  done
}
