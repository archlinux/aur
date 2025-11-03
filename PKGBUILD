# Maintainer: tarball <bootctl@gmail.com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Zhanibek Adilbekov <zhanibek.adilbekov@pm.me>

pkgname=gita
pkgver=0.16.8
pkgrel=1
pkgdesc="Command-line tool to manage multiple git repos"
arch=('any')
url="https://github.com/nosarthur/gita"
license=('MIT')
depends=('git' 'python' 'python-argcomplete' 'python-packaging')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('acee5d2aac682b4c253519982fece5c5007c1f90d34648ab79eeb05bd8f23935')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"

  install -Dm644 auto-completion/bash/.gita-completion.bash \
    "$pkgdir/usr/share/bash-completion/completions/gita"

  install -Dm644 auto-completion/fish/gita.fish \
    "$pkgdir/usr/share/fish/vendor_completions.d/gita.fish"

  install -Dm644 auto-completion/zsh/_gita \
    "$pkgdir/usr/share/zsh/site-functions/_gita"
}
