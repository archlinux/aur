# Maintainer: Amish <contact at via dot aur>
# Contributor: Isaac C. Aronson <i@pingas.org>

_user=shirkdog
pkgname=pulledpork
pkgver=0.7.3
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
source=("pulledpork-${pkgver}.tar.gz::https://github.com/${_user}/${pkgname}/archive/${pkgver}.tar.gz"
        "pulledpork.conf"
        "pulledpork_update.sh"
        "pulledpork.service"
        "pulledpork.timer")
sha256sums=('48c66dc9abb7545186d4fba497263c1d1b247c0ea7f0953db4d515e7898461a2'
            '361f698adbabdb85eaa559e26ae9feaca0ef1f419e76fe301364d9b67358475c'
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
