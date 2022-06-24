# Maintainer: Petrus <petrus@dismail.de>

pkgname=mailctl-bin
_pkgname="${pkgname%-bin}"
pkgver=0.3.5
pkgrel=1
pkgdesc="Provide OAuth2 renewal and authorization capabilities"
arch=(x86_64)
url="https://github.com/pdobsan/${_pkgname}"
license=('BSD')
groups=()
depends=(gnupg fdm msmtp)
makedepends=()
optdepends=('pass: stores, retrieves, generates, and synchronizes passwords securely'
            'gnome-keyring: Stores passwords and encryption keys'
           )
provides=(${_pkgname})
conflicts=(${_pkgname} ${_pkgname}-git)
source=(https://github.com/pdobsan/${_pkgname}/releases/download/${pkgver}/${_pkgname}-${pkgver}-Linux
        https://github.com/pdobsan/${_pkgname}/releases/download/${pkgver}/${_pkgname}-${pkgver}-Linux.sha256
        https://github.com/pdobsan/${_pkgname}/archive/refs/tags/${pkgver}.tar.gz
       )
noextract=(${_pkgname}-${pkgver}-Linux ${_pkgname}-${pkgver}-Linux.sha256)

sha256sums=(SKIP SKIP SKIP)

prepare() {
  sha256sum -c ${_pkgname}-${pkgver}-Linux.sha256
}

package() {
  install -Dm755 ${_pkgname}-${pkgver}-Linux ${pkgdir}/usr/bin/${_pkgname}
  cd $_pkgname-$pkgver
  install -Dm644 LICENSE ${pkgdir}/usr/share/${_pkgname}/LICENSE
  install -Dm644 README.md ${pkgdir}/usr/share/${_pkgname}
  cp -r configs ${pkgdir}/usr/share/${_pkgname}
}
