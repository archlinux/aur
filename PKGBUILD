# Maintainer: Patrick Burroughs (Celti) <celti@celti.name>

# Unofficial repository (x86_64 and i686) available:
# Build scripts at: https://repo.celti.name/nuvolaplayer/
#
# # Both the packages and the database are signed:
# # `pacman-key --recv-keys 123C3F8B058A707F86643316FA682BD8910CF4EA`
# # `pacman-key --lsign-key 123C3F8B058A707F86643316FA682BD8910CF4EA`
# [nuvolaplayer]
# SigLevel = Required TrustedOnly
# Server = https://repo.celti.name/archlinux/$repo/$arch

pkgname=nuvolaplayer-git
pkgver=3.1.0.r37.g4d5feb9
pkgrel=1

arch=('i686' 'x86_64')
license=('GPL')
pkgdesc='Cloud music integration for your Linux desktop.'
url='https://tiliado.eu/nuvolaplayer/'

source=("$pkgname::git+https://github.com/tiliado/nuvolaplayer"
        'nuvola-app-git-1.0.1.template')
sha256sums=('SKIP'
            '22fe31b839cd7f0e17047ebc3c2ff8ab53e032b42173fa81f83031815e30a33c')

depends=('diorite-git' 'webkit2gtk' 'libarchive')
makedepends=('git' 'python' 'vala')
optdepends=('nuvola-app-amazon-cloud-player-git:   Amazon Cloud Player integration'
            'nuvola-app-bandcamp-git:              Bandccamp integration'
            'nuvola-app-deezer-git:                Deezer integration'
            'nuvola-app-google-play-music-git:     Google Play Music integration'
            'nuvola-app-groove-git:                Microsoft Groove Music integration'
            'nuvola-app-jango-git:                 Jango integration'
            'nuvola-app-kexp-git:                  KEXP-FM (Seattle 90.3) integration'
            'nuvola-app-logitech-media-server-git: Logitech Media Server integration'
            'nuvola-app-mixcloud-git:              Mixcloud integration'
            'nuvola-app-owncloud-music-git:        OwnCloud Music integration'
            'nuvola-app-plex-git:                  Plex Media integration'
            'nuvola-app-soundcloud-git:            SoundCloud integration'
            'nuvola-app-spotify-git:               Spotify integration'
            'nuvola-app-tunein-git:                TuneIn integration'
            'nuvola-app-yandex-music-git:          Yandex.Music integration'
            'nuvola-app-google-calendar-git:       (Experimental) Google Calendar integration'
            'nuvola-app-8tracks-git:               8tracks.com integration (not functional)'
            'nuvola-app-hype-machine-git:          Hype Machine integration (not functional)'
            'nuvola-app-pandora-git:               Pandora integration (not functional)' )

pkgver() {
	cd "$pkgname"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$pkgname"
	python ./waf configure --prefix=/usr
	python ./waf build
}

package() {
	cd "$pkgname"
	python ./waf install --no-system-hooks --destdir="${pkgdir}"

	# Installl makepkg template for nuvola-app-*-git integrations.
	install -Dm644 "${srcdir}/nuvola-app-git-1.0.1.template" "${pkgdir}/usr/share/makepkg-template/nuvola-app-git-1.0.1.template"
	ln -s nuvola-app-git-1.0.1.template "${pkgdir}/usr/share/makepkg-template/nuvola-app-git.template"
}
