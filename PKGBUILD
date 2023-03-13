# Maintainer: Petrus <petrus@dismail.de>

pkgname=mailctl-bin
_pkgname="${pkgname%-bin}"
pkgver=0.8.6
release_bin="${_pkgname}-${pkgver}-Linux-x86_64"
pkgrel=1
pkgdesc="Provide OAuth2 renewal and authorization capabilities"
arch=(x86_64)
url="https://sr.ht/~petrus/${_pkgname}"
#url="https://github.com/pdobsan/${_pkgname}"
license=('BSD')
groups=()
depends=(gnupg)
makedepends=()
optdepends=(
            'msmtp: an SMTP client'
            'fdm: fetch and deliver mail'
            'cronie: cron daemon to execute scheduled commands'
            'pass: stores, retrieves, generates, and synchronizes passwords securely'
            'gnome-keyring: Stores passwords and encryption keys'
           )
provides=(${_pkgname})
conflicts=(${_pkgname} ${_pkgname}-git)
source=(https://git.sr.ht/~petrus/mailctl/refs/download/${pkgver}/$_pkgname-$pkgver.tgz)
sha256sums=('9d7192a52efb58f03a7991d158141561e7a31b567f07835a7817ba403d31bca1')

install=.INSTALL

package() {
  cd $_pkgname-$pkgver
  install -Dm755 ${release_bin} ${pkgdir}/usr/bin/${_pkgname}

  install -Dm644 LICENSE ${pkgdir}/usr/share/${_pkgname}/LICENSE
  install -Dm644 README.md ${pkgdir}/usr/share/${_pkgname}
  install -Dm644 cabal.project.freeze ${pkgdir}/usr/share/${_pkgname}
  cp -r configs ${pkgdir}/usr/share/${_pkgname}

  install -Dm644 completions/${_pkgname}.bash ${pkgdir}/usr/share/bash-completion/completions/${_pkgname}.bash
  install -Dm644 completions/${_pkgname}.fish ${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish
  install -Dm644 completions/${_pkgname}.zsh ${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}
}

