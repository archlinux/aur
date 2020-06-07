# Maintainer: vn158 <vn158 at seznam dot cz>

pkgname=fiosign
pkgver=5.0.0
pkgrel=1
pkgdesc='Fio bank signer (signing tool).'
arch=('i686' 'x86_64')
url='http://www.fio.cz'
license=('custom:free')
groups=()
depends=('java-runtime')
makedepends=('imagemagick')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=('!strip')

source=( ${url}/apps/signer_client.jar ${url}/apps/bcprov-jdk16-146.jar ${url}/docs/web_pics/logo_P_662_C_pod_sebou.png ${pkgname}.desktop ${pkgname})
noextract=(signer_client.jar bcprov-jdk16-146.jar)

md5sums=('b53ab4b453117dbdf8bf18a4566c03ca'
         '881ce7b0e75a764892eafa63af7e4d38'
         '8c547b7238959ceec1289a58587df35a'
         '367bbe660b09aff0c709311f97bd5674'
         '96a46c0a1737038982eec27df09fb73f')
sha1sums=('2e8c3c618b18f47570c1bc187edcc730bf313906'
          'ce091790943599535cbb4de8ede84535b0c1260c'
          'de3bae7de31e388450715c03aa4777a719254c6f'
          '3c59fc5ef1fd226e148f909c0b21c3c66bdc9cb9'
          '970199b7757ceb43ed04446c729d84da4131e492')

build() {
  for _size in 256 128 64 48 32 24 16 ; do
    convert logo_P_662_C_pod_sebou.png -trim -resize ${_size}x -background transparent -extent ${_size}x${_size} +repage -strip \
    -define png:compression-level=9 fiosign-${_size}.png
  done
}

package() {
  #cd "$startdir"
  install -d -m755 ${pkgdir}/usr/share/${pkgname}
  install -d -m755 ${pkgdir}/usr/bin
  install -m644 *.jar ${pkgdir}/usr/share/${pkgname}
  install -m755 ${pkgname} ${pkgdir}/usr/bin
  for _size in 256 128 64 48 32 24 16 ; do
    install -m644 -D ${pkgname}-${_size}.png "${pkgdir}/usr/share/icons/hicolor/${_size}x${_size}/apps/${pkgname}.png"
  done
  install -m644 -D ${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
