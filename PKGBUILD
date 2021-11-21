# Maintainer: Francesco Minnocci <ascoli dot minnocci at gmail dot com>
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Alex Smith <azphreal19@protonmail.com

pkgname=koel
pkgver=5.1.8
pkgrel=1
pkgdesc="A personal music streaming server that works."
arch=('any')
url="https://koel.dev/"
license=('MIT')
depends=('php' 'python3' 'mysql' 'openssl')
makedepends=('composer' 'nodejs-lts-fermium')
backup=('usr/share/webapps/koel/.env')
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/${pkgname}/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('b12b359beba8cde455f3da1213a24bb6f35ad6f7d11983c29f1fdced8c18af3afd08fcfdf2b600a2f7c85bb6085b62db5edda8f9ab1777595cfdcf41d6c5bca9')

prepare() {
  cp "${srcdir}/${pkgname}-${pkgver}"/.env{.example,}
  sed -i 's|FFMPEG_PATH=/usr/local/bin/ffmpeg|FFMPEG_PATH=/usr/bin/ffmepg|g' "${srcdir}/${pkgname}-${pkgver}/.env.example"
}

build() {
  cd "$pkgname-$pkgver"

  composer update
  php -d 'extension=exif' /usr/bin/composer install
}

package() {
  mkdir -p "${pkgdir}/usr/share/webapps"
  cp -r "${pkgname}-${pkgver}" "${pkgdir}/usr/share/webapps/${pkgname}"
}
# vim:set ts=2 sw=2 et:
