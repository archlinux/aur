# Maintainer: Sumner Evans <sumner.evans98 at gmail dot com>

pkgbase='offlinemsmtp'
pkgname=('offlinemsmtp')
_module='offlinemsmtp'
pkgver='0.3.8'
pkgrel=1
pkgdesc='Use msmtp offline by queuing email until you have an internet connection.'
url='https://git.sr.ht/~sumner/offlinemsmtp'
depends=(
    'python'
    'python-watchdog'
    'python-gobject'
)
makedepends=('python-setuptools')
license=('GPL3')
arch=('any')
source=(
    'https://files.pythonhosted.org/packages/source/o/offlinemsmtp/offlinemsmtp-0.3.8.tar.gz'
    'https://git.sr.ht/~sumner/offlinemsmtp/blob/v0.3.8/systemd/offlinemsmtp.service'
)
noextract=(
    'offlinemsmtp.service'
)
md5sums=('16dcab47937058d362331592285086e5'
         '9f96e70c7e1deec45aa04b6a91bda89e')
replaces=('python-offlinemsmtp')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    install -Dm644 offlinemsmtp.service "${pkgdir}/usr/lib/systemd/user/offlinemsmtp.service"
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
