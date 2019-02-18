# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=python-cheat
pkgver=2.5.1
pkgrel=1
pkgdesc="Cheat allows you to create and view interactive cheatsheets on the command-line."
url="https://github.com/chrisallenlane/cheat"
depends=('python' 'python-docopt' 'python-pygments' 'python-termcolor')
makedepends=('python')
optdepends=('bash-completion' 'zsh-completions' 'fish')
license=('GPL3')
arch=('any')
source=("https://github.com/chrisallenlane/cheat/archive/${pkgver}.tar.gz")
sha256sums=('9ae44cfc79478a7ba604871f3253e176f2bf3e1a4e698c9466e58a39d279effd')

build() {
  cd "${srcdir}/cheat-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/cheat-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1
  install -dm755 "${pkgdir}"/usr/share/{bash-completion/completions,zsh/site-functions,fish/completions}
	install -m 644 cheat/autocompletion/cheat.bash "${pkgdir}/usr/share/bash-completion/completions/cheat"
	install -m 644 cheat/autocompletion/cheat.zsh "${pkgdir}/usr/share/zsh/site-functions/cheat"
  install -m 644 cheat/autocompletion/cheat.fish "${pkgdir}/usr/share/fish/completions/cheat"
}

# vim:set ts=2 sw=2 et:
