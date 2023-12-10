# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Shivansh <shivansh-007 + aur at outlook <.> com>
# Contributor: SuperMazingCoder  <supermazingcoder + aur at gmail <.> com>
# Contributor: Kenee Patel <patelkenee2804 + aur at gmail <.> com>

pkgname=piston-cli
pkgver=1.5.0 
pkgrel=2
pkgdesc="A universal shell supporting 36+ languages, in terminal code editor with syntax highlight, code compiler (36+ languages). It can run code from pastebin links and files too. "
arch=('any')
url="https://github.com/Shivansh-007/piston-cli" 
license=('MIT')
depends=( 
 'python-pygments'
 'python-requests'
 'python-prompt_toolkit'
 'python-rich'
)
makedepends=(
 'git' 
 'python-setuptools'
 'python-build'
 'python-poetry-core'
 'python-installer'
) 
optdepends=() 
provides=('piston-cli') 
conflicts=('piston-cli') 
source=(${pkgname}::${url}"/archive/refs/tags/v"${pkgver}".tar.gz") 
sha256sums=('SKIP')

build() {
 cd $(ls | grep piston-cli-)
 python -m build --wheel --no-isolation
}

package() {
 cd $(ls | grep piston-cli-)
 python -m installer --destdir="$pkgdir" dist/*.whl
 install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" 
}

pkgver() { 
 printf "%s" $(curl -s https://api.github.com/repos/Shivansh-007/piston-cli/releases/latest | grep -w "\"name\"" | grep -Eo "[[:digit:]]{1,}.[[:digit:]]{1,}.[[:digit:]]{1,}")
}

