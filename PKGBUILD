# Maintainer: Leonid Lednev <leonidledn at gmail dot com>
# Contributor: GI_Jack <GI_Jack@hackermail.com>
_name=aardwolf
pkgname="python-$_name"
pkgver=0.2.16
pkgrel=2
pkgdesc="Asynchronous RDP/VNC client in Python (headless)"
url="https://github.com/skelsec/$_name"
arch=('x86_64')
license=('MIT')
depends=(
  'python>=3.11'
  'python-unicrypto>=0.0.11'
  'python-asyauth>=0.0.16'
  'python-asysocks>=0.2.9'
  'python-tqdm'
  'python-colorama'
  'python-asn1crypto'
  'python-asn1tools'
  'python-pyperclip>=1.8.2'
  'python-arc4>=0.3.0'
  'python-pillow>=9.0.0'
  'glibc'
  'libgcc'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools>=62.4'
  'python-setuptools-rust>=1.5.2'
  'rust'
  'git'
)
source=("git+$url#tag=$pkgver")
b2sums=('51d7ac2f131c43a25056d7d4b2204baaa981d7d14395eabf666f4abbaff84eb8e33c400a3c354e5d1962419d18b4a2a817cc3c27fc6a6e4ea21dee92569b8843')

prepare() {
  cd "$_name"
  git clean -dfx
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch -m rust/Cargo.toml --locked --target host-tuple
}

build() {
  cd "$_name"
  export RUSTUP_TOOLCHAIN=stable
  python -m build -wnx
}

package() {
  cd "$_name"
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm0644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim: ts=2 sw=2 et:
