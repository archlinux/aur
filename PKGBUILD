# Maintainer: MedzikUser <nivua1fn@duck.com>
_repo='MedzikUser/imgurs'
_ver=v0.3.0

_pkgname='imgurs'
pkgname="${_pkgname}"
pkgver=0.3.0
pkgrel=1
pkgdesc='CLI for Imgur API'
arch=('x86_64')
url="https://github.com/${_repo}"
license=('BSD3')

depends=('libnotify')
makedepends=('git' 'cargo')

source=("${_pkgname}::git+${url}#tag=${_ver}")
sha256sums=('SKIP')

build() {
  cd "${_pkgname}"

  cargo build --release
}

package() {
  cd "${_pkgname}"

  install -Dm 755 target/release/${_pkgname} "${pkgdir}/usr/bin/${pkgname}"

  mkdir -p "$pkgdir"/usr/share/{bash-completion/completions,zsh/site-functions,fish/vendor_completions.d}
  target/release/${_pkgname} completions bash > "$pkgdir"/usr/share/bash-completion/completions/${pkgname}
  target/release/${_pkgname} completions zsh > "$pkgdir"/usr/share/zsh/site-functions/_${pkgname}
  target/release/${_pkgname} completions fish > "$pkgdir"/usr/share/fish/vendor_completions.d/${pkgname}.fish

  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
