# Maintainer: Gadget3000 <gadget3000@msn.com>
# Contributor: Eothred <yngve.levinsen@gmail.com>
# Contributor: EvanA <evan@thelinuxman.us>

pkgname=spotify-beta
pkgver=1.0.7.153
_anotherpkgver=.gb9e8174a
pkgrel=1
pkgdesc="A proprietary peer-to-peer music streaming service"
arch=('x86_64')
license=('custom:"Copyright (c) 2006-2010 Spotify Ltd"')
install=spotify.install
url="http://www.spotify.com"
changelog='spotify.changelog'
options=('!strip')
conflicts=('spotify')

source=("http://repository.spotify.com/pool/non-free/s/spotify-client/spotify-client_${pkgver}${_anotherpkgver}_amd64.deb"
'spotify.protocol'
)
md5sums=('9f5157bb783b64b194b958de001434a6'
'ef25ddc5b6bf8fe1a0d64cbd79e1f7b4')

depends=("alsa-lib>=1.0.14" "glibc>=2.6" "openssl" "gconf" "nss" "systemd" "gtk2" "libxtst" "libx11")
optdepends=('desktop-file-utils: Adds URI support to compatible desktop environments'
'ffmpeg-compat: Adds support for playback of local files'
'libnotify: Adds desktop notifications')

package() {
    cd "${srcdir}"

    tar -xf data.tar.gz -C "${pkgdir}"

    install -d "${pkgdir}/usr/share/"

    # Copy license

    # Copy protocol file if KDE is installed
    if [ -f /usr/bin/startkde ]; then
        echo "Installing with KDE support"
        install -Dm644 "${srcdir}/spotify.protocol" "${pkgdir}/usr/share/kde4/services/spotify.protocol"
    fi
}
