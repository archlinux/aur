# Maintainer: Cyannide <cyannide@nullhost.net>
# Contributor: tinywrkb <tinywrkb@gmail.com>
# Contributor: Felix Laurie von Massenbach <felix@erbridge.co.uk>
pkgname=python-powerline-gitstatus
gitname=powerline-gitstatus
pkgver=1.3.3
pkgrel=1
pkgdesc="A Powerline segment for showing the status of a Git working copy"
arch=('any')
url="https://github.com/Cyannide/powerline-gitstatus"
license=('MIT')
depends=('python' 'git')
makedepends=('python-setuptools')
install=${pkgname}.install
source=("${pkgname}::git+https://github.com/Cyannide/${gitname}.git#tag=v${pkgver}"
	colorschemes_default.json
	themes_shell_default.json)
sha256sums=('SKIP'
	    'fa349e0ebea95608f41db180778deed341117478fad4aa682783642b34be2f20'
	    'b15c603a1b15c2b3f9dcfa77fd90422b1cce0db87b2bdea7c730453921d0dd59')

build() {
    cd ${pkgname}
    python setup.py build
}

package() {
    cd "${srcdir}/${pkgname}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -Dm644 README.md "${pkgdir}"/usr/share/doc/${pkgname}/README.md
    install -Dm644 "${srcdir}"/colorschemes_default.json "${pkgdir}"/usr/share/doc/${pkgname}/colorschemes/default.json
    install -Dm644 "${srcdir}"/themes_shell_default.json "${pkgdir}"/usr/share/doc/${pkgname}/themes/shell/default.json
}
