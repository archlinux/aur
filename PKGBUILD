# Maintainer: Meriadec Pillet <meriadec.pillet@gmail.com>
pkgname=mjml-app
pkgver=2.7.1
pkgrel=1
pkgdesc='The desktop app for MJML'
arch=('any')
url="https://github.com/mjmlio/${pkgname}"
license=('MIT')
depends=('yarn')
source=(
  "https://github.com/mjmlio/${pkgname}/archive/${pkgver}.tar.gz"
  "mjml-app.desktop"
)
md5sums=(
  'ed024f35219e586dd572db1224ceaa5e'
  '1f20e11d8f8e674500bdda8054e859c8'
)

package() {
  install -D -m644 "mjml-app.desktop" "${pkgdir}/usr/share/applications/mjml-app.desktop"

  cd "${srcdir}/${pkgname}-${pkgver}/"

  yarn
  yarn package

  install -dm755 "${pkgdir}/opt/"
  chmod -R 755 "release/linux-unpacked"
  cp -r "release/linux-unpacked" "${pkgdir}/opt/mjml-app"
  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/mjml-app/mjml-app" "${pkgdir}/usr/bin/mjml-app"

  install -D -m644 "${srcdir}/${pkgname}-${pkgver}/assets/resources/icons/128x128.png" "${pkgdir}/opt/mjml-app/resources/app/assets/icon.png"
  install -d -m755 "${pkgdir}/usr/share/icons/hicolor/128x128/apps"
  ln -s "/opt/mjml-app/resources/app/assets/icon.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/mjml-app.png"
}
