# Maintainer: Yunhui Fu <yhfudev@gmail.com>

pkgname=aria2c-daemon
pkgver=r18.e48e61f
pkgrel=1
pkgdesc='Daemonize aria2c'
license=('GPL3')
arch=(any)
depends=('aria2')
conflicts=('aria2-daemon-svn')
replaces=('aria2-daemon-svn')
makedepends=('git')
url='https://github.com/yhfudev/aria2c-daemon-arch.git'
install=$pkgname.install

source=("${pkgname}::git+https://github.com/yhfudev/aria2c-daemon-arch.git"
        aria2c-env.conf
        aria2c.conf
        aria2cd.service
        )
md5sums=('SKIP'
         'ed34ec0a71bf7c9e4174a6ffffa6decc'
         '8578a6838cb838c7faa3675504195182'
         '31e046f846131a3a88ee2cf732723d4e')

pkgver() {
    cd "${srcdir}/${pkgname}"
    echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
    msg 'package ...'
    install -D -m644 "${srcdir}/${pkgname}/aria2c-env.conf" "${pkgdir}/etc/conf.d/aria2c-env.conf"
    install -D -m600 "${srcdir}/${pkgname}/aria2c.conf"     "${pkgdir}/etc/conf.d/aria2c.conf"
    install -D -m755 "${srcdir}/${pkgname}/aria2cd.service" "${pkgdir}/etc/systemd/system/aria2cd.service"
}
