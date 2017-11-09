# Maintainer: Johannes Wienke <languitar@semipol.de>

pkgname=autosuspend
pkgver=0.6
pkgrel=1
pkgdesc="A daemon to suspend your server in case of inactivity"
arch=(any)
url="https://github.com/languitar/autosuspend"
license=('GPL2')
depends=('python' 'python-psutil')
optdepends=('python-mpd2: MPD playing status checks'
            'python-requests: Kodi playing status checks'
            'xprintidle: X server idle time cheks')
makedepends=('python-setuptools' 'python-pytest-runner')
source=("https://github.com/languitar/autosuspend/archive/release-${pkgver}.tar.gz")
sha256sums=('7fe7a3840892dd70d3857bce18c82bf9cd769ec2ee412e0dfdc37e51a8e067ee')
backup=('etc/autosuspend.conf'
        'etc/autosuspend-logging.conf')

package() {
    cd "$pkgname-release-${pkgver}"
    python3 setup.py install --root="$pkgdir/" --install-data=/usr
    # setuptools install_data is a nightmare, and cannot be made to respect the
    # filesystem hierarchy. Do things manually instead.
    mv "$pkgdir/usr/etc" "$pkgdir"
}
