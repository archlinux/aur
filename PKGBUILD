# Maintainer:  Caleb Maclennan <caleb@alerque.com>
# Contributor: Jeremy Asuncion <jeremyasuncion808@gmail.com>
# Contributor: Simon Legner <Simon.Legner@gmail.com>

_pkgname=lab
pkgname=$_pkgname-bin
pkgver=0.19.0
pkgrel=1
pkgdesc='A hub-like tool for GitLab (pre-built binary release)'
arch=('x86_64')
url="https://zaquestion.github.io/$_pkgname"
license=('custom:Unlicense')
depends=('git')
optdepends=('hub')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("https://github.com/zaquestion/${pkgname%-bin}/releases/download/v$pkgver/lab_${pkgver}_linux_amd64.tar.gz")
sha256sums=('8e619240d63a50bbb910aed8ed51d3b94f9ce9a4bb8c56f54f4cbadd41ef95f7')

build () {
    ./lab completion bash > completion.bash
    ./lab completion zsh > completion.zsh
}

package() {
    install -Dm755 -t "$pkgdir/usr/bin/" $_pkgname
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
    install -Dm644 completion.bash "$pkgdir/usr/share/bash-completion/completions/lab"
    install -Dm644 completion.zsh "$pkgdir/usr/share/zsh/site-functions/_lab"
}
