# Maintainer: Maxim Andersson <thesilentboatman@gmail.com>

pkgname=lockee
pkgver=1.0.0
pkgrel=2
pkgdesc="Temporary encrypted file lockers on the web"
arch=('any')
url="https://github.com/hbons/Lockee"
license=('AGPL3')
depends=('nodejs')
makedepends=('npm')
options=(!emptydirs)
source=("https://github.com/hbons/${pkgname^}/archive/${pkgver}.tar.gz")
sha256sums=('241c555d4422b53ba144c55e4ac749c7a1b86e813537473666e8397d6d30d739')

prepare() {
  cd "${srcdir}/${pkgname^}-${pkgver}"

  # Bumping the sqlite3 and node-sass dependencies 
  sed -i 's/2.1.1/3.x/g' package.json
  sed -i 's/3.0.0-alpha.0/3.x/g' package.json

  # Fix path in service file
  sed -i 's|share/lockee|lib/node_modules/Lockee|g' "${pkgname}.service"
}

package() {
  cd "${srcdir}/${pkgname^}-${pkgver}"

  npm install --cache ../cache --user root -g --prefix "${pkgdir}/usr"
  install -Dm644 "${pkgname}.service" -t "${pkgdir}/usr/lib/systemd/system"
}

# vim:set ts=2 sw=2 et:
