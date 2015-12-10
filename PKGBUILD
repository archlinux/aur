# Maintainer: Konstantin Stepanov <me@kstep.me>
pkgname=systemd-cron-next
pkgver=1.0.0.rc2
_gitver=1.0.0-rc2
pkgrel=1
pkgdesc="systemd generator to generate timers/services from crontab and anacrontab files"
url="https://github.com/systemd-cron/systemd-cron-next"
arch=('any')
license=('GPL3')
depends=('systemd')
makedepends=('rust')
provides=('cron' 'anacron')
replaces=('cron' 'anacron')
source=("https://github.com/systemd-cron/systemd-cron-next/archive/v${_gitver}.zip")
md5sums=('2784d761ddd1e0a2ebcca48984281145')

build() {
    cd "${srcdir}/${pkgname}-${_gitver}"
    if which multirust; then
        multirust override stable
    fi
    ./configure --prefix="$pkgdir/usr"
    make build
}

package() {
    cd "${srcdir}/${pkgname}-${_gitver}"
    make install
}
