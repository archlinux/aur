# Maintainer: vn158 <vn158 at seznam dot cz>

pkgname=fiosign
pkgver=6.0.1
pkgrel=1
pkgdesc='Fio signer (bank signing tool).'
arch=('any')
url='http://www.fio.cz'
license=('LicenseRef-FioSigner')
groups=()
depends=('java-runtime' 'hicolor-icon-theme')
makedepends=('imagemagick')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=('!strip' '!debug')

source=(${url}/apps/signer_client.jar ${url}/docs/web_pics/logo_P_662_C_pod_sebou.png LICENSE ${pkgname}.desktop ${pkgname})
noextract=(signer_client.jar)

sha256sums=('d78708e2bdcbd3fc84b849c7e14fe8bafdccab1efc919d19ca659235fdd32291'
            'cc2cc5d63f2094bd7ae2c5a068bc39feed3f14bd2be778b2a7fd66d30aa74a0e'
            '3c918e3d0a096f48e6c439b9d69d2ec48882417af6a1e9c2ee6c03ee8a617a6f'
            '1e5edbd1705e28847f6dce23d15d8f094172374f9edb63c18a300b8c4612210d'
            'a898bad70075a8d65e532501c08bd1de133e862fb584c2a0e73756ccdd167254')

build() {
  for _size in 256 128 64 48 32 24 16 ; do
    magick logo_P_662_C_pod_sebou.png -trim -resize ${_size}x \
    -background transparent -extent ${_size}x${_size} +repage -strip \
    -define png:compression-level=9 fiosign-${_size}.png
  done
}

package() {
  install -d -m755 ${pkgdir}/usr/share/${pkgname}
  install -d -m755 ${pkgdir}/usr/share/licenses/${pkgname}
  install -d -m755 ${pkgdir}/usr/bin
  install -m644 signer_client.jar ${pkgdir}/usr/share/${pkgname}
  install -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}
  install -m755 ${pkgname} ${pkgdir}/usr/bin
  for _size in 256 128 64 48 32 24 16 ; do
    install -m644 -D ${pkgname}-${_size}.png "${pkgdir}/usr/share/icons/hicolor/${_size}x${_size}/apps/${pkgname}.png"
  done
  install -m644 -D ${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
