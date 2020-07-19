# Maintainer: gCurse <gcurse at web de>

pkgname=otr-verwaltung3p-dev
pkgver=1.0.0b8
pkgrel=9
pkgdesc='Manage your onlinetvrecorder.com files: cut, preview cuts, rate cutlists etc.'
arch=('any')
url='https://github.com/EinApfelBaum/otr-verwaltung3p'
license=('GPL3')
depends=('gtk3' 'python' 'python-gobject' 'gst-python' 'python-appdirs' 'python-psutil' 'python-cairo'
         'python-requests' 'python-keyring' 'gst-plugins-base' 'gst-plugins-good' 'gst-plugin-gtk'
         'gst-plugins-bad' 'gst-plugins-ugly' 'gst-libav' 'mpv' 'ffmpeg' 'ffms2' 'mediainfo'
         'mkvtoolnix-cli' 'x264')
optdepends=('gnome-keyring: To store the password in keyring'
            'kwallet: To store the password in wallet'
            'mediainfo-gui: For plugin Mediainfo')
makedepends=('python-setuptools')
conflicts=('otr-verwaltung3p' 'otr-verwaltung3p-dev-git')
provides=('otr-verwaltung3p')

_pkgname='otr-verwaltung3p'

source=("https://github.com/EinApfelBaum/otr-verwaltung3p/archive/${pkgver}.tar.gz"
        "bin.otrverwaltung3p.diff")
sha256sums=('60d20095048b4a215be3fdab89742a8c0abf2114150b61a2b8de8e4fd68df780'
            '52125d7957be3b42f14d63b9526d3e66751cbb9cfa29de2a329a63df57d6a0a0')
options=('!strip')

prepare() {
    # hotfix
    sed -i "s/self\(.*\)disconnect(self.row_activate_id)/# self\1disconnect(self.row_activate_id)/" \
           "${srcdir}/${_pkgname}-${pkgver}/data/plugins/Play.py"
    patch "${srcdir}/${_pkgname}-${pkgver}/bin/otrverwaltung3p" bin.otrverwaltung3p.diff
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py install --prefix=/usr --root=${pkgdir} --optimize=1
}
