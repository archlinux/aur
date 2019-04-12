# Maintainer: Nazar Mishturak <nazarmx@gmail.com> 
_binname=step-cli
pkgname=$_binname-bin
pkgver=0.9.2
pkgrel=1
pkgdesc="A zero trust swiss army knife for working with X509, OAuth, JWT, OATH OTP, etc."
arch=('x86_64')
url="https://smallstep.com/cli"
license=('Apache')

source=("https://github.com/smallstep/cli/releases/download/v${pkgver}/step_${pkgver}_linux_amd64.tar.gz"
	"https://github.com/smallstep/cli/raw/v${pkgver}/autocomplete/bash_autocomplete"
	"https://github.com/smallstep/cli/raw/v${pkgver}/autocomplete/zsh_autocomplete")

sha256sums=('f8642d02b6dd21d89883ac5e507b347a14beb5b609a8cbb50485b3b99b154932'
            'add3e078e394e265f6b6a3bf12af81cc7897410ae5e6a0d4ee7714a5b856a7be'
            '5f5e5bc5cdd96109a82f91e61b8cdffb8695aee201d3bd61ca3874471819372e')

prepare() {
	sed -i "s/step/${_binname}/g" "zsh_autocomplete"
}

package() {
	install -Dm755 "step_$pkgver/bin/step" "$pkgdir/usr/bin/$_binname"
	install -Dm644 "step_$pkgver/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 "bash_autocomplete" "$pkgdir/usr/share/bash-completion/completions/$_binname"
	install -Dm644 "zsh_autocomplete" "$pkgdir/usr/share/zsh/site-functions/_${_binname}"
}
