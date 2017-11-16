#Maintainer: Marc Jose <Hering2007@web.de>
#Contributor: Lars Jose <larsjose77@gmail.com>
pkgname=franz-bin
pkgver=5.0.0_beta.13
pkgrel=3
pkgdesc='Free messaging app for services like WhatsApp, Slack, Messenger and many more.'
arch=('x86_64')
depends=('gconf' 'nodejs' 'libx11' 'libxext' 'libxss' 'libxkbfile')
makedepends=('tar' 'yarn' 'npm' 'xorriso' 'git' 'python2')
conflicts=('franz')
url='https://github.com/meetfranz/franz'
license=('Apache')
source=("${pkgname}.desktop" "https://github.com/meetfranz/franz/archive/v${pkgver//_/-}.tar.gz")
sha256sums=('f72d9fcad1e1de482a35414f5a346c7e3d6c6140849861f7a5fbfbf32dcded36'
            '4627d75c7d146f0cb96b9cd72bc26cdbd99e426f08735ee230fe92795765393d')
            
build () {
  cd "franz-${pkgver//_/-}"
  yarn add gulp-cli@1.2.2 gulpjs/gulp#4.0 
  yarn rebuild --production --non-interactive
  USE_SYSTEM_XORRISO=true yarn build
}

package () {
  cd "franz-${pkgver//_/-}"
  install -d "${pkgdir}/usr/bin" "${pkgdir}/usr/share"
  cp -r --preserve=mode out/linux-unpacked "${pkgdir}/usr/share/${pkgname}"
  install -Dm644 "$srcdir/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "build-helpers/images/icon.png" "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/${pkgname}.png"
  ln -s "/usr/share/${pkgname}/franz" "${pkgdir}/usr/bin/${pkgname}"
}
