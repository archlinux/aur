# Maintainer: Trent Palmer trenttdually at gmail
_name='deoplete'
pkgname="${_name}-git"
pkgver=3.0.r91.g5c84f5b
pkgrel=1
pkgdesc="deoplete completion plugin for neovim"
arch=('any')
url="https://github.com/Shougo/deoplete.nvim"
license=('MIT')
groups=()
depends=('python-neovim' 'python2-neovim')
makedepends=('git') 
provides=('deoplete')
conflicts=('deoplete')
replaces=('')
backup=()
options=()
install="${_name}.install"
source=("${_name}::${url//https/git}")
noextract=()
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_name}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    mkdir -p "$pkgdir/usr/share/nvim/runtime"
    cp -r "${srcdir}/${_name}/"{autoload,doc,plugin,rplugin} \
        "$pkgdir/usr/share/nvim/runtime"

    install -D -m644 "${srcdir}/${_name}/README.md" $pkgdir/usr/share/doc/$pkgname/README.md
    install -D -m644 "${srcdir}/${_name}/LICENSE" $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
