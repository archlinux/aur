# Maintainer: KillWolfVlad <github.com/KillWolfVlad>
# Contributor: WaveHack <email@wavehack.net>
# Contributor: Whovian9369 <Whovian9369@gmail.com>

pkgname=('gitahead')
pkgrel=1
pkgver=2.1.0
pkgdesc='THE MOST POWERFUL GIT GUI'
url='http://gitahead.scitools.com/'
provides=('gitahead')
conflicts=('gitahead')
arch=('x86_64')
license=('custom')
depends=('')
source=(
  "gitahead-${pkgver}.bin::https://gitahead.com/downloads/v${pkgver}/GitAhead-${pkgver}.sh"
  "gitahead-license"
  "gitahead.desktop"
  "gitahead.png"
  "gitahead.sh"
)
sha256sums=('809fa3e6af88a13801ba6315224638e262fc378034448047fd55dc173fedfe76'
            'd71bfb48c954d213986816fc29478c7f80c8bd2dd10d2889bf51897d649eedd6'
            '6070ebf6752f55f8b7d8a79107ce491c3acf04310eeb9a8242b83cfb4df055f2'
            '66cb53fc57eb2ce2e6cd02ff392476fdfb91b723b76ef5da1856e9b5dc1b5c75'
            'ba4e21c675ce7f49e6df27df1f29d1bb99c47679c4981657a2a4cf5d59930b4a')

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
  chmod 755 "${pkgdir}/opt/gitahead/indexer"
  chmod 755 "${pkgdir}/opt/gitahead/relauncher"

  install -D -m644 "${srcdir}/gitahead-license" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m755 "${srcdir}/gitahead.sh" "${pkgdir}/usr/bin/gitahead"
  install -D -m644 "${srcdir}/gitahead.desktop" "${pkgdir}/usr/share/applications/gitahead.desktop"
  install -D -m644 "${srcdir}/gitahead.png" "${pkgdir}/usr/share/pixmaps/gitahead.png"
}
