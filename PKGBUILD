# Maintainer: Sumner Evans <sumner.evans98 at gmail dot com>

pkgbase='offlinemsmtp'
pkgname=('offlinemsmtp')
_module='offlinemsmtp'
pkgver='0.3.6'
pkgrel=1
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
    'https://files.pythonhosted.org/packages/source/o/offlinemsmtp/offlinemsmtp-0.3.6.tar.gz'
    'https://gitlab.com/sumner/offlinemsmtp/raw/master/systemd/offlinemsmtp.service'
)
noextract=(
    'offlinemsmtp.service'
)
md5sums=('93a2d08a075d3811eadd2b7367526482'
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
