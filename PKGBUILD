# Maintainer: thomashrb <thomashrb AT protonmail DOT com>
# Contributor: Sérgio Gomes <superherointj at gmail dot com>
pkgname=ponyup
pkgver=0.6.5
pkgzip=$pkgname-$pkgver-x86_64.tar.gz
pkgrel=1
pkgdesc="The Pony language toolchain multiplexer"
arch=('x86_64')
url="https://github.com/ponylang/ponyup"
license=('BSD')
makedepends=(
  'curl'
  'sed'
  'tar'
)
depends=('openssl')
source_x86_64=($pkgzip::https://dl.cloudsmith.io/public/ponylang/releases/raw/versions/$pkgver/ponyup-x86-64-unknown-linux.tar.gz)
sha256sums_x86_64=('f0fa73bfbbd0e186bc8b22872837196c1672a373e25bf88749db4b59ecbb4784')


install=${pkgname}.install

prepare() {
  tmp_dir=/tmp/ponyup
  mkdir -p "${tmp_dir}"
  tar -xzf "${pkgzip}" -C "${tmp_dir}/"
}

package() {
  ponyup_bin=$(find ${tmp_dir} -name ponyup -type f)
  ponyup_root=$HOME/.local/share/ponyup
  install_dir=$ponyup_root/bin
  mkdir -p $install_dir
  chmod -R 646 $install_dir
  echo "x86_64-linux-gnu" > "${ponyup_root}/.platform"
  install -Dm755  $ponyup_bin $install_dir
}
