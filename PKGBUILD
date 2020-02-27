# Maintainer: AliReza AmirSamimi <alireza.amirsamimi at gmail dot com>
# Co-Maintainer: M A <morealaz at gmail dot com>

pkgname='persepolis-git'
pkgver=3.2.0.r50.gee8c781
pkgrel=1
pkgdesc="A graphical front-end for aria2 download manager with lots of features (Github version)."
arch=('any')
url="https://persepolisdm.github.io/"
license=('GPL3')
depends=('aria2' 'libnotify' 'libpulse' 'python' 'python-psutil' 'python-pyqt5' 'python-requests' 'python-setproctitle' 'qt5-svg' 'sound-theme-freedesktop' 'youtube-dl' 'ffmpeg')
makedepends=('git' 'python-setuptools')
optdepends=('adwaita-qt: for using adwaita style in GTK based Desktops.')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/persepolisdm/persepolis.git")
sha256sums=('SKIP')

pkgver() {
    cd ${pkgname%-git}
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd ${pkgname%-git}
    gzip -k -9 ./man/persepolis.1
}

package() {
    cd ${pkgname%-git}
    python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1
}
# vim:set ts=4 sw=4 et:
