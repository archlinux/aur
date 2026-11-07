# Maintainer: Leonid Lednev <leonidledn at gmail dot com>
# Contributor: GI_Jack <GI_Jack@hackermail.com>
_name=aardwolf
pkgname="python-$_name"
pkgver=0.2.17
pkgrel=1
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
b2sums=('5f87364a71abb15784d1373279272ddf5bf797b23f7c83600772fb0cb937b40b7e83a9b69ae90417a539f2408d0de0eb0f8b508c48962330ba66bb5e0910c9fd')

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
