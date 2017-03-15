# Maintainer: Patrick Burroughs (Celti) <celti@celti.name>

pkgname=nuvolaplayer
pkgver=3.0.7
pkgrel=1

arch=('i686' 'x86_64')
license=('GPL')
pkgdesc='Cloud music integration for your Linux desktop.'
url='https://tiliado.eu/nuvolaplayer/'

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tiliado/${pkgname}/archive/${pkgver}.tar.gz"
        'nuvola-app-1.5.1.template')
sha256sums=('affe97b2dedd93e4c49b1c5eb52d9d42272a04ebb934cbce65a25ea1a259ab54'
            '429f12bfa9bb8100c493eb80de067677e0023a7dec629d2fe895124e687f7a51')

depends=('diorite' 'webkit2gtk' 'libarchive')
makedepends=('python' 'vala')
optdepends=(
    'nuvola-app-amazon-cloud-player:     Amazon Cloud Player integration for Nuvola Player 3.0'
    'nuvola-app-bandcamp-git:            Bandcamp integration for Nuvola Player.'
    'nuvola-app-google-play-music:       Google Play integration for Nuvola Player.'
    'nuvola-app-mixcloud-git:            Mixcloud integration for Nuvola Player 3 from Github'
    'nuvola-app-spotify:                 Spotify for Nuvola Player 3'
    'nuvola-app-yandex-music:            Yandex Music integration for Nuvola Player.'
    'nuvola-app-youtube:                 Integration of YouTube into your linux desktop via Nuvola Player 3.0.'
    'nuvola-app-8tracks:                 8tracks.com integration'
)

build() {
  cd "${pkgname}-${pkgver}"
  python ./waf configure --prefix=/usr
  python ./waf build
}

package() {
  cd "${pkgname}-${pkgver}"
  python ./waf install --no-system-hooks --destdir="${pkgdir}"

  install -Dm644 "${srcdir}/nuvola-app-1.5.1.template" "${pkgdir}/usr/share/makepkg-template/nuvola-app-1.5.1.template"
  ln -s nuvola-app-1.5.1.template "${pkgdir}/usr/share/makepkg-template/nuvola-app.template"
}
