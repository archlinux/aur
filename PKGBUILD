# Maintainer: Tun Win Naing <twnaing(at)outlook(dot)com>
pkgname=puma-dev-bin
_pkgname=puma-dev
pkgver=0.16.2
pkgrel=1
pkgdesc="A fast, zero-config development server for macOS and Linux"
arch=('x86_64')
url="https://github.com/puma/puma-dev/"
license=(BSD)
optdepends=('authbind: to bind 80/443 ports'
            'dev-tld-resolver: to resolve .test domain'
            'p11-kit: for SSL support')
provides=('puma-dev')
source=("https://github.com/puma/puma-dev/releases/download/v${pkgver//_/-}/puma-dev-${pkgver//_/-}-linux-amd64.tar.gz"
        'system.service'
        'user.service'
        "https://raw.githubusercontent.com/puma/puma-dev/v${pkgver//_/-}/LICENSE")
md5sums=('f6dd065d5cbfe23ab2b6c93c3498d7e6'
         '9f88d670d220d36ee75b97c496c7970d'
         'f0906043620889a1903b5f69c349029f'
         'SKIP')

package(){
  cd "$srcdir"

  install -d "${pkgdir}"/usr/bin
  install -Dm755 puma-dev "${pkgdir}"/usr/bin/puma-dev

  install -d "${pkgdir}"/usr/lib/systemd/system
  install -Dm644 "${srcdir}"/system.service "${pkgdir}"/usr/lib/systemd/system/puma-dev.service
  install -Dm644 "${srcdir}"/user.service "${pkgdir}"/usr/lib/systemd/user/puma-dev.service

  install -d "${pkgdir}"/usr/share/licenses/puma-dev/
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/puma-dev/LICENSE"
}

# vim:set ts=2 sw=2 et:
