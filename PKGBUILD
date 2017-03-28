# Maintainer: Johannes Wienke <languitar@semipol.de>

pkgname=autosuspend
pkgver=0.4
pkgrel=2
pkgdesc="A daemon to suspend your server in case of inactivity"
arch=(any)
url="https://github.com/languitar/autosuspend"
license=('GPL2')
depends=('python' 'python-psutil')
optdepends=('python-mpd2: MPD playing status checks'
            'python-requests: Kodi playing status checks'
            'xprintidle: X server idle time cheks')
makedepends=('python-setuptools')
source=("https://github.com/languitar/autosuspend/archive/release-${pkgver}.tar.gz")
sha256sums=('c7d1f6f238b65d5257bfd4fc74ccdfe4ed5fe340060c1c59f50e7065d88a8dbc')
backup=('etc/autosuspend.conf'
        'etc/autosuspend-logging.conf')

package() {
    cd "$pkgname-release-${pkgver}"
    python3 setup.py install --root="$pkgdir/" --install-data=/usr
    # setuptools install_data is a nightmare, and cannot be made to respect the
    # filesystem hierarchy. Do things manually instead.
    mv "$pkgdir/usr/etc" "$pkgdir"
}
