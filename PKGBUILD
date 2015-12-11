# Maintainer: Konstantin Stepanov <me@kstep.me>
pkgname=systemd-cron-next
pkgver=1.0.0.rc3
_gitver=1.0.0-rc3
pkgrel=4
pkgdesc="systemd generator to generate timers/services from crontab and anacrontab files"
url="https://github.com/systemd-cron/systemd-cron-next"
arch=('any')
license=('GPL3')
depends=('systemd>=217' 'run-parts')
makedepends=('rust>=1.4.0' 'cargo>=0.6.0')
provides=('cron' 'anacron')
replaces=('cron' 'anacron')
source=("https://github.com/systemd-cron/systemd-crontab-generator/archive/v${_gitver}.zip")
md5sums=('4e6b09e929ce98caee088dd22b86f96a')

build() {
    cd "${srcdir}/${pkgname}-${_gitver}"
    if which multirust; then
        multirust override stable
    fi
    ./configure --prefix="/usr" --confdir="/etc"
    DESTDIR="${pkgdir}" make build
}

package() {
    cd "${srcdir}/${pkgname}-${_gitver}"
    DESTDIR="${pkgdir}" make install
}
