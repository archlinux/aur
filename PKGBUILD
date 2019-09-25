# Maintainer: Ilaï Deutel

pkgname='git-machete'
pkgver=2.11.1
pkgrel=1
pkgdesc="Probably the sharpest git repository organizer & rebase workflow automation tool you've ever seen"
arch=('any')
url='https://github.com/VirtusLab/git-machete'
license=('MIT')
depends=('git' 'python')
makedepends=('python-setuptools' 'python-pbr')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/VirtusLab/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('b33a3f43932e6142b5e6538c3d6931b7d9a1be42b7ac9eebb1499f89d1f35f9d')

prepare() {
  export PBR_VERSION="$pkgver"
}

build() {
  cd "$srcdir/$pkgname-${pkgver}"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-${pkgver}"

  # Install the package
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build

  # Install bash and zsh completions
  install -Dm644 "completion/git-machete.completion.bash" "$pkgdir/usr/share/bash-completion/completions/git-machete"
  install -Dm644 "completion/git-machete.completion.zsh" "$pkgdir/usr/share/zsh/site-functions/_git-machete"

  # Install the license
  install -Dm 644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
