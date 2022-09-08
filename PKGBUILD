# Maintainer: Bart Van Loon <bbb at bbbart dot be>

pkgbase='offlinemsmtp'
pkgname=('offlinemsmtp')
_module='offlinemsmtp'
pkgver='0.3.10'
pkgrel=1
pkgdesc='Use msmtp offline by queuing email until you have an internet connection.'
url='https://github.com/sumnerevans/offlinemsmtp'
depends=(
    'python'
    'python-watchdog'
    'python-gobject'
)
makedepends=('python-poetry' 'python-installer')
license=('GPL3')
arch=('any')
source=(
    'https://github.com/sumnerevans/offlinemsmtp/archive/refs/tags/v0.3.10.tar.gz'
    'https://raw.githubusercontent.com/sumnerevans/offlinemsmtp/master/systemd/offlinemsmtp.service'
)
noextract=(
    'offlinemsmtp.service'
)
sha256sums=('35735db733b2e9c871fd5b528c0c31a4a86b7e0aaef8866cbe039cd1d9c2d2bf'
            '4c104ec682190c5459a89d6fc09bdd4a33f80302bd1888d01b7264dfcbdff9a9')
replaces=('python-offlinemsmtp')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    poetry build
}

package() {
    install -Dm644 offlinemsmtp.service "${pkgdir}/usr/lib/systemd/user/offlinemsmtp.service"
    cd "${srcdir}/${_module}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
