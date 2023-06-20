# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: Trizen <echo dHJpemVueEBnbWFpbC5jb20K | base64 -d>

_pkg="youtube-viewer"
_pkgname="gtk-${_pkg}"
pkgname="gtk2-${_pkg}"
pkgver=3.3.3
pkgrel=1
pkgdesc="A Gtk2 application for searching and streaming videos from YouTube."
arch=('any')
url="https://github.com/trizen/${_pkg}"
license=('Artistic2.0')
makedepends=('perl-module-build')
provides=(
  "${_pkg}"
  "${_pkgname}")
conflicts=(
  "${_pkg}"
  "${_pkg}-git"
  "${_pkgname}"
  "${_pkgname}-git")
depends=(
  'perl>=5.16.0'
  'perl-data-dump'
  'perl-file-sharedir'
  'perl-json'
  'perl-lwp-protocol-https'
  'perl-libwww'
  'gtk2-perl'
)
optdepends=(
  'perl-json-xs: faster JSON to HASH conversion'
  'perl-lwp-useragent-cached: cache support'
  'perl-unicode-linebreak: for printing results in a fixed-width format (-W)'
  'perl-term-readline-gnu: for better STDIN support'
  'youtube-dl: for playing videos with encrypted signatures'
  'wget: for downloading videos with wget'
  'mplayer: for playing videos with MPlayer'
  'vlc: for playing videos with VLC'
  'smplayer: for playing videos with SMPlayer'
  'mpv: for playing videos with MPV (recommended)'
  'gnome-icon-theme: for icons in menus'
)
source=(
  "${_pkg}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz"
)
sha256sums=('f36d500f733079bf8cf0fc78550ea215afa485c1ceaeec2bfdaa62a32314a7c8')


check() {
    cd "${_pkg}-${pkgver}"
    ./Build test
}

package() {
    cd "${_pkg}-${pkgver}"
    /usr/bin/perl Build.PL --destdir "${pkgdir}" \
	                   --installdirs vendor \
			   --gtk
    ./Build
    ./Build install --install_path script=/usr/bin

    install -Dm 644 "share/${_pkgname}.desktop" \
	            "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm 644 "share/icons/${_pkgname}.png" \
	            "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
