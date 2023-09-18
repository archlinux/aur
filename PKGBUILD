# Maintainer: Petrus <petrus@dismail.de>

pkgname=mailctl-bin
_pkgname="${pkgname%-bin}"
pkgver=0.9
pkgrel=1
pkgdesc="Provide OAuth2 renewal and authorization capabilities"
arch=(x86_64 aarch64)
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
release=$_pkgname-$pkgver-Linux
source_x86_64=(https://git.sr.ht/~petrus/mailctl/refs/download/${pkgver}/$release-x86_64.tgz)
source_aarch64=(https://git.sr.ht/~petrus/mailctl/refs/download/${pkgver}/$release-aarch64.tgz)
sha256sums_x86_64=('a74d655ef48e8941c7eabac1c4f0737bc96541e002085be8baf69b49d1ba8813')
sha256sums_aarch64=('4b6398990e09ff88ce5f017a711c50cd2b8e76f98af943362da6e462a6ea0435')

install=.INSTALL

package() {
  cd $release-$CARCH
  install -Dm755 ${_pkgname} ${pkgdir}/usr/bin/${_pkgname}

  install -Dm644 LICENSE ${pkgdir}/usr/share/${_pkgname}/LICENSE
  install -Dm644 README.md ${pkgdir}/usr/share/${_pkgname}
  install -Dm644 cabal.project.freeze ${pkgdir}/usr/share/${_pkgname}
  cp -r configs ${pkgdir}/usr/share/${_pkgname}

  install -Dm644 completions/${_pkgname}.bash ${pkgdir}/usr/share/bash-completion/completions/${_pkgname}.bash
  install -Dm644 completions/${_pkgname}.fish ${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish
  install -Dm644 completions/${_pkgname}.zsh ${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}
}
