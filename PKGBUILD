# Contributor: Gergely Imreh <imrehg gmail com>

pkgname=particle-cli
pkgdesc='CLI tool for the Particle hardware platform'
pkgver=2.9.1
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
md5sums=('2cf5ff1ada971967f1602172e3cf7055')
sha256sums=('4ea10c4ce749d83e67d84154303767f9b551eaaace395a2196d3cb6c988664fd')

package() {
  npm install -g --user root --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"
  sed -i 's|, GROUP="plugdev", MODE="0666"|, TAG+="uaccess"|g' "${pkgdir}/usr/lib/node_modules/${pkgname}/assets/50-particle.rules"
  install -D -m644 "${pkgdir}/usr/lib/node_modules/${pkgname}/assets/50-particle.rules" "${pkgdir}/etc/udev/rules.d/50-particle.rules"
  rm `find "${pkgdir}/" -name '.deps'` -rf
}
