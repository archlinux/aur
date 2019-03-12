# Maintainer: Michael Beaumont <mjboamail@gmail.com>
# URL: https://github.com/michaelbeaumont/aur-packages
_pkgname=prototool
pkgname=${_pkgname}-bin
pkgdesc="Your Swiss Army Knife for Protocol Buffers"
pkgver=1.3.0
pkgrel=1
arch=(x86_64)
url="https://github.com/uber/prototool"
provides=("${_pkgname}=$pkgver")
conflicts=("${_pkgname}-git")
license=('MIT')
source=(
  "https://github.com/uber/prototool/releases/download/v${pkgver}/prototool-Linux-$arch.tar.gz"
  "https://raw.githubusercontent.com/uber/prototool/v${pkgver}/LICENSE"
)
sha256sums=(
  6ccf1bc63f7806d7b2a8cfa72a8be702db0dd042e1639b169f26f8376888ba90
  3ea0f1c42ee5f6a0a87f8ee8c386c30017e3159419ce457ea65ff07bd2629d5f
)

package() {
    install -dm755 "$pkgdir/usr/share/bash-completion/completions/"
    install -dm755 "$pkgdir/usr/share/zsh/site-functions/"
    install -dm755 "$pkgdir/usr/share/man/man1/"
    install -dm755 "$pkgdir/usr/share/licenses/${pkgname}/"
    install -m644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/"
    install -dm755 "$pkgdir/usr/bin/"

    cd "$_pkgname"

    install -m755 bin/* -t "$pkgdir/usr/bin"

    install -m644 etc/bash_completion.d/* "$pkgdir/usr/share/bash-completion/completions"
    install -m644 etc/zsh/site-functions/* "$pkgdir/usr/share/zsh/site-functions"

    install -m644 share/man/man1/* "$pkgdir/usr/share/man/man1"
}
