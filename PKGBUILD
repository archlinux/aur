# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Sebastian Lau <archlinux _at_ slau _dot_ info>
# Contributor: Eric Ozwigh <ozwigh at gmail dot com>
# Contributor: chrisx8

pkgname=veracrypt-latest
_pkgname=VeraCrypt
pkgver=1.25.7
pkgrel=1
pkgdesc='Disk encryption with strong security based on TrueCrypt'
url='https://www.veracrypt.fr/'
arch=('x86_64')
license=('custom:TrueCrypt')
depends=('fuse2>=2.8.0' 'wxgtk3>=3.0' 'libsm' 'device-mapper')
optdepends=('sudo: mounting encrypted volumes as nonroot users')
makedepends=('yasm')
provides=('veracrypt')
conflicts=('veracrypt')
source=(https://launchpad.net/veracrypt/trunk/${pkgver}/+download/VeraCrypt_${pkgver}_Source.tar.bz2{,.sig}
        veracrypt.desktop)
sha512sums=('824a3cfa3a3fb702f92522a23ae33b1033f56f3224e4666c7b0dd6c1a4a5841c7ba148c8cd9a7fa900b0a6dda2febc65acbb57ee77a04666b7a2867a1063f981'
            'SKIP'
            'f689ca64bac7042030de7714aed8cc89f2c5f87b407444b1b121491c1d89c147babaaa454ddc2a93b70ae20d4da59f96ad64f01b04bea9017d658c377faeb75d')
# Import key with: curl -sS https://www.idrix.fr/VeraCrypt/VeraCrypt_PGP_public_key.asc | gpg --import -
validpgpkeys=('5069A233D55A0EEB174A5FC3821ACD02680D16DE') # VeraCrypt Team <veracrypt@idrix.fr>

prepare() {
  cd src
  chmod -R u+w . # WAT award
}

build() {
  cd src
  make PKG_CONFIG_PATH=/usr/lib/pkgconfig \
    WX_CONFIG=/usr/bin/wx-config-gtk3
}

package() {
  cd src
  install -Dm 755 Main/${pkgname%-latest} "${pkgdir}/usr/bin/${pkgname%-latest}"
  install -Dm 644 "${srcdir}/veracrypt.desktop" -t "${pkgdir}/usr/share/applications"
  install -Dm 644 Resources/Icons/VeraCrypt-256x256.xpm "${pkgdir}/usr/share/pixmaps/veracrypt.xpm"
  install -Dm 644 License.txt -t "${pkgdir}/usr/share/licenses/${pkgname%-latest}"
}

# vim: ts=2 sw=2 et:
