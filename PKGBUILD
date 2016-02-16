_name='zsh-autosuggestions'
pkgname="${_name}-git"
pkgver=0.2.1.123.45ab49d
pkgrel=1
pkgdesc='Fish shell like fast/unobtrusive autosuggestions for zsh'
url='https://github.com/tarruda/zsh-autosuggestions'
arch=('any')
license=('Custom:MIT')
depends=('zsh')
makedepends=('git')
provides=('zsh-autosuggestions')
install="${_name}.install"
source=("${_name}::${url//https/git}")
sha256sums=('SKIP')

pkgver() {
   cd "${srcdir}/${_name}"
   echo "0.2.1.$(git rev-list --count HEAD).$(git describe --always )"
}

package() {
    cd "${srcdir}/${_name}"
    make -B zsh-autosuggestions.zsh
    install -d "${pkgdir}/usr/share/zsh/plugins/${_name}"
    cp -a --no-preserve=ownership "zsh-autosuggestions.zsh" "${pkgdir}/usr/share/zsh/plugins/${_name}"

    # license
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
}

check() {
    cd "${srcdir}/${_name}"
    make test
}
