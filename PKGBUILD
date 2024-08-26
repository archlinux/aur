# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# Maintainer: tee < teeaur at duck dot com >
# -*- sh -*-

pkgname='codon-bin'
_pkgname="${pkgname%%-bin}"
pkgver=0.17.0
pkgrel=1
pkgdesc='High-performance, zero-overhead, extensible Python compiler using LLVM'
arch=('x86_64')
url='https://github.com/exaloop/codon'
_rawurl='https://raw.githubusercontent.com/exaloop/codon/develop'
license=('custom:Business Source License 1.1')
depends=(
  'cython'
  'gcc-libs'
  'glibc'
  'python'
  'python-astunparse'
  'python-setuptools'
  'sh'
)
provides=('codon')
conflicts=('codon')
_tarball="codon-$pkgver.tar.gz"
source=(
  'codon.sh'
  "$_tarball::$url/releases/download/v$pkgver/codon-linux-$CARCH.tar.gz"
  "$_rawurl/LICENSE"
  "$_rawurl/README.md"
)
noextract=("$_tarball")

package() {
  umask 022
  install -dm0755 "$pkgdir/opt"

  bsdtar -xf "$_tarball" -C "$pkgdir/opt"

  install -Dm0755 codon.sh  "$pkgdir/usr/bin/codon"
  install -Dm0644 README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"
  install -Dm0644 LICENSE   "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

b2sums=('718328c0651e383b892e7c1f00b795f88c6f4775b02e3a2ba217873d105e51824f380ba55b8602d1698da12ee3609641a753a6aa7660d5d4df52ea855eca5ca7'
        '675dbbe1da6543d8b2637f1bf07df77acdfadba839448311aafc3181de62be5ddb3f922965aba4464c16595d3bf549cf965db5f1ad0869cf03cbd882148911c2'
        'cccad58126306902fbdc7e6fd5b6a8aefe737da60bef778a3bd775e7b158aa8454fda22ead7d6fef0dc42b65d754db66c8a824049e0b0f4351b8ecb9c2079b58'
        'd879cf1d81b12dc94bab359c79b1123b6140c50a93ef01d354ad31255c175475c0f3ad63b6e0efe725599aa9a9937fba7a54bf9ec37a4e11b797406627b69a89')

# eof
