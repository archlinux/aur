# Contributor: Gergely Imreh <imrehg gmail com>

pkgname=particle-cli
pkgdesc='CLI tool for the Particle hardware platform'
pkgver=2.1.1
pkgrel=1
arch=(any)
url='http://particle.io/'
license=('GPL')
depends=('libusb' 'nodejs')
makedepends=('npm' 'git' 'python2')
optdepends=('dfu-util: local flashing'
            'openssl: local flashing')
source=(http://registry.npmjs.org/$pkgname/-/${pkgname}-${pkgver}.tgz)
noextract=(${pkgname}-${pkgver}.tgz)
md5sums=('7d092fd2551a1c2b4f02528113b383ed')
sha256sums=('fdbd38c53fa541ca4faefe8c50f1d4ceb5432f06327e52cc2334e0bec78ccaaa')

package() {
  npm install -g --user root --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"
  sed -i 's|, GROUP="plugdev"||g; s|, MODE="0666"||g' "${pkgdir}/usr/lib/node_modules/${pkgname}/assets/50-particle.rules"
  install -D -m644 "${pkgdir}/usr/lib/node_modules/${pkgname}/assets/50-particle.rules" "${pkgdir}/etc/udev/rules.d/50-particle.rules"
  rm `find "${pkgdir}/" -name '.deps'` -rf
}
