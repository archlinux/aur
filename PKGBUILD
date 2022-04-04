# Maintainer:  kernel1024 <kernelonline at gmail dot com>

pkgname=aplugedit-git
_pkgname=aplugedit
pkgver=20220404.c22282a
pkgrel=2
pkgdesc="APlugEdit is a graphical schematic editor for ALSA .asoundrc file"
arch=('i686' 'x86_64')
url="https://github.com/kernel1024/aplugedit"
license=('GPL3')

depends=('qt5-base>=5.10.0' 'alsa-lib' 'ladspa')
optdepends=('gstreamer: Sample player support with interactive debug logging' )

makedepends=('git')
source=("git+https://github.com/kernel1024/aplugedit.git")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git log -1 --format='%cd.%h' --date=short | tr -d -
}

build () {
    cd "$srcdir/${_pkgname}"
    qmake-qt5
    make
}

package () {
    cd "$srcdir/${_pkgname}"
    make INSTALL_ROOT="${pkgdir}" install
}
