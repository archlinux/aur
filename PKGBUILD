# Maintainer: Petrus <petrus@dismail.de>

pkgname=mailctl-bin
_pkgname="${pkgname%-bin}"
pkgver=0.9.1
pkgrel=1
pkgdesc="Provide OAuth2 renewal and authorization capabilities"
arch=(x86_64 aarch64)
url="https://github.com/pdobsan/${_pkgname}"
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

source_x86_64=(https://github.com/pdobsan/mailctl/releases/download/${pkgver}/$release-x86_64.tgz)
source_aarch64=(https://github.com/pdobsan/mailctl/releases/download/${pkgver}/$release-aarch64.tgz)
sha256sums_x86_64=('43666602ca70a7f63e4e4c7ee0768252d6e288bf8e7aa145526b21fee2c199ef')
sha256sums_aarch64=('b2e540df6f7f063aa93ac3fc999acfec517cb577949a8cfdc63bf0b28603df8a')

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
