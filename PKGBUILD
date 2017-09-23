# Maintainer: KillWolfVlad <github.com/KillWolfVlad>

pkgname=('gitahead')
pkgrel=1
pkgver=1.4.4
pkgdesc='THE MOST POWERFUL GIT GUI'
url='http://gitahead.scitools.com/'
provides=('gitahead')
conflicts=('gitahead')
arch=('x86_64')
license=('custom')
source=(
  "gitahead-${pkgver}.bin::https://gitahead.com/downloads/v${pkgver}/GitAhead-${pkgver}.sh"
  "gitahead-license"
  "gitahead.desktop"
  "gitahead.png"
  "gitahead.sh"
)
sha256sums=('e6f5f02d15c896b986be818c02721e253f53ec4378272615f68deee67f765d2b'
            'd71bfb48c954d213986816fc29478c7f80c8bd2dd10d2889bf51897d649eedd6'
            '6070ebf6752f55f8b7d8a79107ce491c3acf04310eeb9a8242b83cfb4df055f2'
            '66cb53fc57eb2ce2e6cd02ff392476fdfb91b723b76ef5da1856e9b5dc1b5c75'
            'eb9f2de75d533bb1b20affe439e4bd4013511ce32829ca41e37064ef9051dd61')

prepare() {
  tail -n +224 gitahead-${pkgver}.bin > gitahead-${pkgver}.tar.gz
  mkdir -p gitahead-${pkgver}
  bsdtar xvf gitahead-${pkgver}.tar.gz -C gitahead-${pkgver}
}

package() {
  install -d "${pkgdir}/opt"
  cp -R "${srcdir}/gitahead-${pkgver}" "${pkgdir}/opt/gitahead"

  find "${pkgdir}/opt/gitahead/" -type f -exec chmod 644 {} \;
  chmod 755 "${pkgdir}/opt/gitahead/GitAhead"

  install -d "${pkgdir}/usr/bin"

  install -D -m644 "${srcdir}/gitahead-license" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m755 "${srcdir}/gitahead.sh" "${pkgdir}/usr/bin/gitahead"
  install -D -m644 "${srcdir}/gitahead.desktop" "${pkgdir}/usr/share/applications/gitahead.desktop"
  install -D -m644 "${srcdir}/gitahead.png" "${pkgdir}/usr/share/pixmaps/gitahead.png"
}
