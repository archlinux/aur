# Maintainer: Bart Van Loon <bbb at bbbart dot be>

pkgbase='offlinemsmtp'
pkgname=('offlinemsmtp')
_module='offlinemsmtp'
pkgver='0.4.2'
pkgrel=1
pkgdesc='Use msmtp offline by queuing email until you have an internet connection.'
url='https://github.com/bbbart/offlinemsmtp'
depends=(
    'python'
    'python-inotify'
    'python-gobject'
)
makedepends=('python-build' 'python-hatchling' 'python-installer')
license=('GPL3')
arch=('any')
source=(
    'https://github.com/bbbart/offlinemsmtp/archive/refs/tags/v0.4.2.tar.gz'
    'https://raw.githubusercontent.com/bbbart/offlinemsmtp/master/systemd/offlinemsmtp.service'
)
noextract=(
    'offlinemsmtp.service'
)
sha256sums=('6c9ec736ce295aef9b70ad723ea7f553c01b8f6ff877049525270edb4684aab2'
            '4c104ec682190c5459a89d6fc09bdd4a33f80302bd1888d01b7264dfcbdff9a9')
replaces=('python-offlinemsmtp')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    install -Dm644 offlinemsmtp.service "${pkgdir}/usr/lib/systemd/user/offlinemsmtp.service"
    cd "${srcdir}/${_module}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
