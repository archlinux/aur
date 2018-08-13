# Maintainer: Joël Porquet <joel@porquet.org>

pkgname=jpass-git
pkgver=r39.494b3c9
pkgrel=1
pkgdesc="JPass password manager"
url="https://github.com/joel-porquet/jpass/"
arch=('any')
license=('GPL3')
depends=('python' 'python-configobj')
makedepends=('git')

source=("${pkgname}::git+https://github.com/joel-porquet/jpass/")
md5sums=('SKIP')

pkgver() {
    cd ${pkgname}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd ${pkgname}

    python setup.py install --root="$pkgdir/" --optimize=1

    install -Dm0644 data/jpass.zsh-completion "$pkgdir/usr/share/zsh/site-functions/_jpass"
}
