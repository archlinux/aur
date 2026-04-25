# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=blacknon
_pkgname=hwatch
pkgname=${_pkgname}-bin
pkgver=0.4.1
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
            '600c485c226eeeab3f93f47db2cf5b2153034080af890a9f792022593f4d539f')
sha256sums_x86_64=('5c9c09a832ed630ce85db847224d26dfcb1a709c9a771b0f22b272d36f2d7c20')

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
