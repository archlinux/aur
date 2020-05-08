# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgname=fogpad
pkgver=1.0.0
pkgrel=1
pkgdesc="A reverb where reflections can be frozen, filtered, pitch shifted and disintegrated."
arch=('i686' 'x86_64')
url="https://github.com/linuxmao-org/fogpad-port"
license=('MIT')
depends=('cairo' 'jack')
makedepends=('git' 'mesa')
provides=("${pkgname}.lv2")
groups=('pro-audio' 'lv2-plugins' 'vst-plugins')
source=("https://github.com/linuxmao-org/fogpad-port/releases/download/v${pkgver}/${pkgname}-port-${pkgver}.tar.gz")
sha256sums=('75b39c7546a8ee22b82a7af34ffbd6c18867599236df9aa7e9e0b1ee9e3d6a9f')


build() {
  cd "${srcdir}/${pkgname}-port-${pkgver}"
  make PREFIX=/usr
}

package() {
  cd "${srcdir}/${pkgname}-port-${pkgver}"
  make PREFIX=/usr DESTDIR="${pkgdir}" install
  # License
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
