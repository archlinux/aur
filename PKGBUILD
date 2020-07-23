# Maintainer: gCurse <gcurse at web de>

pkgname=otr-verwaltung3p-dev
pkgver=1.0.0b8.post1
pkgrel=10
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
        "otrverwaltung3p_actions_cutvirtualdub.diff")
sha256sums=('62dba87eaca54b546126e09be94bca2c555acf9eebb3fce11657efb9dc708a84'
            '5f3b58ee6f2259a8e5f25420f561c64beb2fb915ac537bc585d768416ad44ee8')
options=('!strip')

prepare() {
    # hotfix
    patch "${srcdir}/${_pkgname}-${pkgver}/otrverwaltung3p/actions/cutvirtualdub.py" otrverwaltung3p_actions_cutvirtualdub.diff
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py install --prefix=/usr --root=${pkgdir} --optimize=1
}
