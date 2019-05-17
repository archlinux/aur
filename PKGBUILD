# Maintainer: Ilaï Deutel

pkgname='git-machete'
pkgver=2.9.0
pkgrel=1
pkgdesc='See what branches are out of sync with their parent branches and painlessly rebase them.'
arch=('any')
url='https://github.com/VirtusLab/git-machete'
license=('MIT')
depends=('git' 'python2')
makedepends=('python2-setuptools' 'python2-pbr')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/VirtusLab/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('faf680ff7e585d6759cfa0fe783cb874716ccf44b880423781dc356a1c3d8020')

prepare() {
  export PBR_VERSION="$pkgver"
}

build() {
  cd "$srcdir/$pkgname-${pkgver}"
  python2 setup.py build
}

package() {
  cd "$srcdir/$pkgname-${pkgver}"

  # Install the package
  python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build

  # Install bash and zsh completions
  install -Dm644 "completion/git-machete.completion.bash" "$pkgdir/usr/share/bash-completion/completions/git-machete"
  install -Dm644 "completion/git-machete.completion.zsh" "$pkgdir/usr/share/zsh/site-functions/_git-machete"

  # Install the license
  install -Dm 644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
