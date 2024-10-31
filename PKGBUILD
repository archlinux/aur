# Maintainer: Jah Way <jahway603 at protonmail dot com>
# Previous Maintainer: Tun Win Naing <twnaing(at)outlook(dot)com>
pkgname=puma-dev-bin
_pkgname=puma-dev
pkgver=0.18.3
pkgrel=1
pkgdesc="A fast, zero-config development server for macOS and Linux"
arch=('x86_64')
url="https://github.com/puma/puma-dev/"
license=(BSD-3-Clause)
optdepends=('authbind: to bind 80/443 ports'
            'dev-tld-resolver-git: to resolve .test domain'
            'p11-kit: for SSL support')
conflicts=('puma-dev' 'puma-dev-git')
provides=('puma-dev')
source=("https://github.com/puma/puma-dev/releases/download/v${pkgver//_/-}/puma-dev-${pkgver//_/-}-linux-amd64.tar.gz"
        'system.service'
        'user.service'
        "https://raw.githubusercontent.com/puma/puma-dev/v${pkgver//_/-}/LICENSE")
sha512sums=('4214fac26071026c0a787df35e3f426711635f2fec4eaf2d1135b35acedd5636cfe68d62ec62f56c9fc627b9adf9953b9e3e53ae725e00f3cf9d860d039ec603'
            'e27217433d57930c2acab8149a1b3e55fb656a74df71ae581e6e5e2feb99b09d96690db169f991d3794b1443bcf71ae57d39f18fc0096ebb5f6ed8f67e340e6f'
            '0c9af265d509bbee11c8809d896f4a2c06965ca4b45d19abd0d45fb2ac2e7f87070dce3888a4b42e644e48673f8d22c3a70d2290f24c0fd57257130515af9ca1'
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
