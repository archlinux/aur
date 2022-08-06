# Maintainer: Petrus <petrus@dismail.de>

pkgname=mailnotify-bin
_pkgname="${pkgname%-bin}"
pkgver=0.2.3
release_bin="${_pkgname}-${pkgver}-Linux-x86_64"
pkgrel=1
pkgdesc="Generate pop-up notifications about incoming email messages"
arch=(x86_64)
url="https://github.com/pdobsan/${_pkgname}"
license=('BSD')
groups=()
depends=(libnotify gtk2)
makedepends=()
optdepends=('dunst: Customizable and lightweight notification-daemon'
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

  install -Dm644 completions/${_pkgname}.bash ${pkgdir}/usr/share/bash-completion/completions/${_pkgname}.bash
  install -Dm644 completions/${_pkgname}.fish ${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish
  install -Dm644 completions/${_pkgname}.zsh ${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}
}

