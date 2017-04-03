# Maintainer: Patrick Burroughs (Celti) <celti@celti.name>

pkgname=nuvolaplayer
pkgver=3.0.4
pkgrel=1

arch=('i686' 'x86_64')
license=('GPL')
pkgdesc='Cloud music integration for your Linux desktop.'
url='https://tiliado.eu/nuvolaplayer/'

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tiliado/${pkgname}/archive/${pkgver}.tar.gz"
        'nuvola-app-1.5.1.template')
sha256sums=('6577f96f305fd9a1d294c6f1a49b5d6a515dd42b026ce58ef89aeb19cd03349d'
            '429f12bfa9bb8100c493eb80de067677e0023a7dec629d2fe895124e687f7a51')

depends=('diorite' 'webkit2gtk' 'libarchive')
makedepends=('python' 'vala')
optdepends=(
	'nuvola-app-8tracks:               8tracks.com integration'
	'nuvola-app-amazon-cloud-player:   Amazon Cloud Player integration'
	'nuvola-app-bandcamp:              Bandccamp integration'
	'nuvola-app-deezer:                Deezer integration'
	'nuvola-app-google-play-music:     Google Play Music integration'
	'nuvola-app-groove:                Microsoft Groove Music integration'
	'nuvola-app-jango:                 Jango integration'
	'nuvola-app-logitech-media-server: Logitech Media Server integration'
	'nuvola-app-mixcloud:              Mixcloud integration'
	'nuvola-app-plex:                  Plex Media integration'
	'nuvola-app-soundcloud:            SoundCloud integration'
	'nuvola-app-spotify:               Spotify integration'
	'nuvola-app-tunein:                TuneIn integration'
	'nuvola-app-yandex-music:          Yandex.Music integration'
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
