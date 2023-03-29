# Maintainer: Anthony Ruhier <anthony.ruhier@gmail.com>
# Many thanks to Justin Dray, maintainer of sickrage, for his PKGBUILD used as
# a base for this one.
pkgname=headphones
pkgver=0.6.0
pkgrel=2
pkgdesc="Music downloader for usenet and torrents."
arch=('any')
url="https://github.com/rembo10/headphones"
license=('GPL3')
depends=('python>=3' 'sh' 'python-urllib3' 'python-pytz' 'python-requests-toolbelt' 'python-markupsafe' 'python-mako' 'python-html5lib' \
  'python-pylast' 'python-jaraco.classes' 'python-six' 'python-musicbrainzngs' 'python-cryptography' 'python-jaraco.context' 'python-lxml' \
  'python-certifi' 'python-colorama' 'python-jaraco.text' 'python-yaml' 'python-gobject' 'python-jaraco.functools' 'python-beautifulsoup4' \
  'gobject-introspection-runtime' 'python-setuptools' 'python-pillow' 'python-mutagen' 'python-zipp' 'python-more-itertools' 'python-soupsieve' \
  'python-chardet' 'python-pygments' 'python-idna' 'gstreamer' 'python-simplejson' 'python-requests' 'python-pyqt5-webkit')
optdepends=('sabnzbd: usenet downloader'
            'nzbget: usenet downloader'
            'transmission-cli: torrent downloader (CLI and daemon)'
            'transmission-gtk: torrent downloader (GTK+)'
            'transmission-qt: torrent downloader (Qt)'
            'deluge: torrent downloader'
            'rtorrent: torrent downloader'
            'jackett: torrent indexer proxy')
conflicts=("${pkgname}-git")
options=('!strip')
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "${pkgname}.service"
        "${pkgname}.sysusers"
        "${pkgname}.tmpfiles")

sha256sums=('e96755547b6a6cd63f2a916d4bdfd5f5a3cc62e1b89db021de441c94c064ddc6'
            'cb362da63786c752d928770d22c8f8ad0a85ca1b6bafe83982bdcb9b4455bbf9'
            '348abc0627d63762a97655b5893c306e5b923857be5d0b876e9df5fea7ef9ed9'
            'ff2a4be9594518b670dafe80023772affc5e8cca85bb4c95972c7c14c72453c2')

package() {
  install -Dm755 -d "${pkgdir}/opt/${pkgname}"
  cp -a "${srcdir}/${pkgname}-${pkgver}"/* "${pkgdir}/opt/${pkgname}"
  install -Dm 644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -Dm 644 "${srcdir}/${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  install -Dm 644 "${srcdir}/${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
}