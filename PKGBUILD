# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
# Co-Maintainer: AliReza AmirSamimi <alireza.amirsamimi at gmail dot com>
pkgname='persepolis-git'
pkgver=5.2.0.r15.g109e952
pkgrel=1
pkgdesc="A download manager written in Python (Github version)"
arch=('any')
url="https://github.com/persepolisdm/persepolis"
license=('GPL3')
depends=('breeze' 'ffmpeg' 'pyside6' 'python-dasbus' 'python-psutil' 'python-pysocks' 'python-requests' 'python-setproctitle' 'python-urllib3' 'qt6-multimedia' 'qt6-svg' 'yt-dlp')
makedepends=('git' 'meson')
optdepends=('qadwaitadecorations-qt6: for using adwaita style in GTK based Desktops.'
            'adwaita-qt6: for using adwaita style in GTK based Desktops. (alternative)')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd ${pkgname%-git}
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd ${pkgname%-git}
    arch-meson build
    meson compile -C build
}

package() {
    cd ${pkgname%-git}
    meson install -C build --destdir "${pkgdir}"
}
# vim:set ts=4 sw=4 et:
