# Maintainer:  Caleb Maclennan <caleb@alerque.com>
# Contributor: Jeremy Asuncion <jeremyasuncion808@gmail.com>
# Contributor: Simon Legner <Simon.Legner@gmail.com>

_pkgname=lab
pkgname=$_pkgname-bin
pkgver=0.20.0
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
sha256sums=('998340ffac7bd7f11638fa5b4bfd28e6e8bd896ba406d27d9028188a1985ac0f')

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
