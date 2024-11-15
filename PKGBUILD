# Maintainer: ZappaBoy <federico.zappone@justanother.group>
pkgname=domo-git
pkgbase=domo-git
pkgver=1.0.3
pkgrel=1
epoch=
pkgdesc="Simple tool to manage IoT devices"
arch=('i686' 'x86_64')
url="https://github.com/ZappaBoy/domo"
source=("git+https://github.com/ZappaBoy/domo")
sha256sums=('SKIP')
license=('GPL')
depends=(
  "python"
  'python-setuptools'
  'python-cryptography'
  "python-requests"
  "python-tinytuya")
makedepends=('git' 'python-installer' 'python-build' 'python-wheel')
provides=("domo")


instructions() {
  /bin/cat << EOF
Remember to create the config.json in your DOMO_ROOT
EOF
}

build() {
    cd "$srcdir/domo/"
  python3 -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/domo/"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 completion/bash/domo "${pkgdir}/usr/share/bash-completion/completions/domo"
  python -m installer --destdir="$pkgdir/domo/" dist/*.whl
  instructions
}

# vim:set ts=2 sw=2 et:
