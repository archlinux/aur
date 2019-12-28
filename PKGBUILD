# Maintainer: Sumner Evans <sumner.evans98 at gmail dot com>

pkgbase='offlinemsmtp'
pkgname=('offlinemsmtp')
_module='offlinemsmtp'
pkgver='0.3.5'
pkgrel=2
pkgdesc='Use msmtp offline by queuing email until you have an internet connection.'
url='https://gitlab.com/sumner/offlinemsmtp'
depends=(
    'python'
    'python-watchdog'
    'python-gobject'
)
makedepends=('python-setuptools')
license=('GPL3')
arch=('any')
source=(
    'https://files.pythonhosted.org/packages/source/o/offlinemsmtp/offlinemsmtp-0.3.5.tar.gz'
    'https://gitlab.com/sumner/offlinemsmtp/raw/master/systemd/offlinemsmtp.service'
)
noextract=(
    'offlinemsmtp.service'
)
md5sums=('8332f62f3172f8d7226098f72a27f0dd'
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
