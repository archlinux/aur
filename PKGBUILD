# Maintainer: Amish <contact at via dot aur>
# Contributor: Isaac C. Aronson <i@pingas.org>

_user=shirkdog
pkgname=pulledpork
pkgver=0.7.4
pkgrel=2
pkgdesc="Tool to automatically update rules for snort"
arch=('any')
url="https://github.com/${_user}/${pkgname}"
license=('GPL')
depends=('perl' 'perl-lwp-protocol-https' 'perl-crypt-ssleay' 'perl-archive-tar' 'perl-switch' 'perl-bytes-random-secure')
optdepends=('snort')
backup=('etc/pulledpork/pulledpork.conf'
        'etc/pulledpork/disablesid.conf'
        'etc/pulledpork/dropsid.conf'
        'etc/pulledpork/enablesid.conf'
        'etc/pulledpork/modifysid.conf')
source=("pulledpork-${pkgver}.tar.gz::https://github.com/${_user}/${pkgname}/archive/v${pkgver}.tar.gz"
        "pulledpork.conf"
        "pulledpork_update.sh"
        "pulledpork.service"
        "pulledpork.timer")
sha256sums=('f0149eb6f723b622024295e0ee00e1acade93fae464b9fdc323fdf15e99c388c'
            '07e937f3fa0d4eefd7aee5c2ea5502b8b8060ecb06fda5f830ce74af65c33493'
            '584326ce79c1694849f60f25e4306ae3f2df6228c34c2e6f3ba30993f53e6a3f'
            '629f7f8a5e274a0615f49d81cbc90e5d3697fa3e85af3ca231000761c73554c3'
            '2ac59ce33d8c7baefc809030c1a393d2951e936f1a9fb7d72ab392a69f6eb949')
install=pulledpork.install

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -m644 -t etc ../pulledpork.conf
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm644 -t "${pkgdir}"/etc/pulledpork etc/*
  install -Dm644 -t "${pkgdir}"/usr/lib/systemd/system ../pulledpork.{service,timer}
  install -Dm755 -t "${pkgdir}"/usr/bin pulledpork.pl ../pulledpork_update.sh
}
