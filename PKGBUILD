# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgname='ivideon-client'
pkgver='6.9.2'
pkgrel='811'
pkgdesc='Ivideon Client'
arch=('x86_64')
url='https://ivideon.com'
license=('freeware')
depends=('qt5-base' 'openssl' 'qt5-multimedia' 'qt5-websockets')
makedepends=('libarchive')
source=("https://packages.ivideon.com/ubuntu/pool/non-free/i/${pkgname}/${pkgname}_${pkgver}.${pkgrel}_amd64.deb"
	"${pkgname}.desktop")
sha256sums=('fa67154585e77859eaae7e40d5f304909a70bd182218b3072e47af60d5793689'
            '2baf7178b17057d0e638d19c1c3feb17e8eb65ea32106d477f9d53e24937020b')
install='ivideon.install'

build() {
  cd "${srcdir}"
  bsdtar xf "data.tar.xz"
}

package() {
  cp -ax "usr" "${pkgdir}"
  # use system QT5 libs for HiDPI scaling support
  rm -rf opt/ivideon/${pkgname}/libQt5*
  cp -ax "opt" "${pkgdir}"
  install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
