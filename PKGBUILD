# Maintainer: Michael Beaumont <mjboamail@gmail.com>
# URL: https://github.com/michaelbeaumont/aur-packages
_pkgname=prototool
pkgname=${_pkgname}-bin
pkgdesc="Your Swiss Army Knife for Protocol Buffers"
pkgver=1.7.0
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
  589c80707f29992f1ed32aff4ba0b4e13cba278b390952915986708c0f5b59b7
  020d43a0acd998e8c1ce91f6ab7ba9fd505c9968dd6d5ce7c7ae9c749641a95e
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
