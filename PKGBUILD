# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=blacknon
_pkgname=hwatch
pkgname=${_pkgname}-bin
pkgver=0.4.0
pkgrel=1
pkgdesc='A modern alternative to the watch command'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${pkgver}"
arch=('x86_64')
license=('MIT')

conflicts=("${_pkgname}")
provides=("${_pkgname}")
depends=('glibc')

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}.${arch[0]}-unknown-linux-gnu.tar.gz")
sha256sums=('83e4dd21429a91fb7cea67a476032a9641425e5355df2e0f589a738b6ec9fd2c'
            'e704249838ba47d6ff500c7a757b6dcf664e69bac011a0a52e210b3504fb4bc7')
sha256sums_x86_64=('3e45a50d21c983e121a0a544ebf96dc8655efddc841f0bede68e32bd5bc29888')

build() {
  cd "${srcdir}/" || exit

  gzip "./man/${_pkgname}.1"
}

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "./bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "./man/${_pkgname}.1.gz" "${pkgdir}/usr/share/man/man1/${_pkgname}.1.gz"

  install -Dm644 "./completion/bash/${_pkgname}-completion.bash" "$pkgdir/usr/share/bash-completion/completions/${_pkgname}"
  install -Dm644 "./completion/fish/${_pkgname}.fish" "$pkgdir/usr/share/fish/vendor_completions.d/${_pkgname}.fish"
  install -Dm644 "./completion/zsh/_${_pkgname}" "$pkgdir/usr/share/zsh/site-functions/_${_pkgname}"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
