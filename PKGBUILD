# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# Maintainer: tee < teeaur at duck dot com >
# -*- sh -*-

pkgname='codon-bin'
_pkgname="${pkgname%%-bin}"
pkgver=0.18.1
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
        'a0f5c8ac1a1e011127694d642901f1003bad4393be2a64c3077a7c33ae44017113cefd584c3c0ae99ab2b31c5e5a7fbc32d383fdc20a26c61a1e40e23b3d9ad0'
        '43452dd4216bba835bff542c02fcd0a80b77fef97a6f1042adcbbbcf312bb856b0707c35b2f1af356e0b4262e501a159f06bf1f947f182d0023cdd4aefbd8a85'
        'b9890221134eef33de18282a53024a6b8b16e7ac899b27c5652212a0158fd197dc680f9a389f94f8932cb24974c88d07509c7b8f28e851c6d4b59d89064bec77')

# eof
