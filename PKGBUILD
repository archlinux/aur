# Maintainer:  Caleb Maclennan <caleb@alerque.com>
# Contributor: Jeremy Asuncion <jeremyasuncion808@gmail.com>
# Contributor: Simon Legner <Simon.Legner@gmail.com>

pkgname=lab-bin
pkgver=0.17.2
pkgrel=2
pkgdesc="A hub-like tool for GitLab (pre-built binary release)"
arch=('x86_64')
url="https://zaquestion.github.io/lab/"
license=('custom:Unlicense')
depends=('git')
optdepends=('hub')
makedepends=('go')
conflicts=("${pkgname%-bin}-git" "${pkgname%-bin}")
source=("https://github.com/zaquestion/${pkgname%-bin}/releases/download/v$pkgver/lab_${pkgver}_linux_amd64.tar.gz")
sha512sums=('d7d91e03f1030a740d440abaa0dc48eb54029807b921dad6b497c2641f54b295f916892a623286f39f53468a2477c327f51794b82dd55c763b62fd62b1bd0db9')

build () {
    ./lab completion bash > completion.bash
    ./lab completion zsh > completion.zsh
}

package() {
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname%-bin}"/LICENSE
    install -Dm755 lab "$pkgdir"/usr/bin/lab
    install -Dm644 completion.bash "$pkgdir/usr/share/bash-completion/completions/lab"
    install -Dm644 completion.zsh "$pkgdir/usr/share/zsh/site-functions/_lab"
}
