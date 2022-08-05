# Maintainer: Petrus <petrus@dismail.de>

pkgname=mailctl-bin
_pkgname="${pkgname%-bin}"
pkgver=0.6.4
release_bin="${_pkgname}-${pkgver}-Linux-x86_64"
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
source=(https://github.com/pdobsan/${_pkgname}/releases/download/${pkgver}/${release_bin}
        https://github.com/pdobsan/${_pkgname}/releases/download/${pkgver}/${release_bin}.sha256
        https://github.com/pdobsan/${_pkgname}/archive/refs/tags/${pkgver}.tar.gz
       )
noextract=(${release_bin} ${release_bin}.sha256)
sha256sums=(SKIP SKIP SKIP)

install=.INSTALL

prepare() {
  sha256sum -c ${release_bin}.sha256
}

package() {
  install -Dm755 ${release_bin} ${pkgdir}/usr/bin/${_pkgname}

  cd $_pkgname-$pkgver
  install -Dm644 LICENSE ${pkgdir}/usr/share/${_pkgname}/LICENSE
  install -Dm644 README.md ${pkgdir}/usr/share/${_pkgname}
  cp -r configs ${pkgdir}/usr/share/${_pkgname}

  install -Dm644 completions/${_pkgname}.bash ${pkgdir}/usr/share/bash-completion/completions/${_pkgname}.bash
  install -Dm644 completions/${_pkgname}.fish ${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish
  install -Dm644 completions/${_pkgname}.zsh ${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}
}

