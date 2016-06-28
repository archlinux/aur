# Maintainer:  Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: neo.shadowsocks<neo.shadowsocks AT gmx.com>
# Contributor: Kars Wang <jaklsy g-mail>

pkgname=lantern
pkgver=2.2.5
pkgrel=1
pkgdesc='Lantern is a free desktop application that delivers fast, reliable and secure access to the open Internet. (Stable Channel)'
arch=('i686' 'x86_64')
url='https://getlantern.org'
license=('Apache')
depends=('libappindicator-gtk3' 'xcb-util' 'xdg-utils')
makedepends=('go>=1.6' 'make' 'gulp' 'npm')
conflicts=('lantern-bin' 'lantern-headless' 'lantern-headless-git')
options=('!emptydirs' '!strip' '!docs')
install=$pkgname.install
source=("https://github.com/getlantern/lantern/archive/${pkgver}.tar.gz"
        'lantern.service'
        'git-update-index.patch')

sha1sums=('3f001eb4543b1f272c3144171c7ceed438c22975'
          'da705ba2fa3608a17258009b933e8bb58b3172a2'
          '0949f76ee7d695156c0a85565ce516a7f3637b2a')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    patch -p1 < ../git-update-index.patch
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    make lantern
}

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}/lantern"    "${pkgdir}/usr/bin/lantern"
    install -Dm644 "${srcdir}/lantern.service"                  "${pkgdir}/usr/lib/systemd/user/lantern.service"
}
