# Maintainer: Shell Chen <aur@sorz.org>
pkgname=nbnhhsh-cli-git
_pkgname=nbnhhsh-cli
pkgver=r9.3c8241d
pkgrel=1
pkgdesc="CLI script for nbnhhsh (能不能好好说话)"
provides=('nbnhhsh-cli')
url='https://github.com/yihong0618/nbnhhsh-cli'
license=('Apache')
arch=('any')
depends=('python>=3.6' 'python-requests' 'python-rich')
makedepends=('python-pip' 'git')
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_pkgname"
  PIP_CONFIG_FILE=/dev/null pip wheel . --no-deps
}

package() {
    cd "$srcdir/$_pkgname"
    PIP_CONFIG_FILE=/dev/null pip install \
        --isolated --root="$pkgdir" --ignore-installed --no-deps \
        *.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
