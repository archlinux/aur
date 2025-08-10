# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=android-sdk-client
pkgver=1.2.5
pkgrel=1
pkgdesc='Display list of available files of SDK repository'
arch=('any')
url='https://github.com/pbakondy/android-sdk-client'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz")
sha256sums=('c666af4861815751d67f29a9520679fce7a12179bcfd876046276caf55bf446d')
noextract=("${pkgname}-${pkgver}.tgz")

package() {
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"

  install -d -m 755 "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "/usr/lib/node_modules/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/"

  # Fix permissions
  find "${pkgdir}/usr" -type d -exec chmod 755 '{}' +

  # npm gives ownership of ALL FILES to build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"
}

