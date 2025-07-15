# Contributor: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# Maintainer: tee < teeaur at duck dot com >

pkgname='codon-bin'
_pkgname="${pkgname%%-bin}"
pkgver=0.19.1
pkgrel=1
pkgdesc='High-performance, zero-overhead, extensible Python compiler using LLVM'
arch=('x86_64')
url='https://github.com/exaloop/codon'
_rawurl='https://raw.githubusercontent.com/exaloop/codon/develop'
license=('Apache-2.0')
depends=(
  'cython'
  'gcc-libs'
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
  "README-$pkgver.md::$_rawurl/README.md"
)
noextract=("$_tarball")

package() {
  umask 022
  install -dm0755 "$pkgdir/opt"

  bsdtar -xf "$_tarball" -C "$pkgdir/opt"

  install -Dm0755 codon.sh  "$pkgdir/usr/bin/codon"
  install -Dm0644 "README-$pkgver.md" "$pkgdir/usr/share/doc/$_pkgname/README.md"
  install -Dm0644 LICENSE   "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

b2sums=('718328c0651e383b892e7c1f00b795f88c6f4775b02e3a2ba217873d105e51824f380ba55b8602d1698da12ee3609641a753a6aa7660d5d4df52ea855eca5ca7'
        '86f196b45f1fd5a1e3740869bbf99b109720412e6af3752b27caa1ea6c06c73fa88b1e01cdd97d6ab485375a58e96eff33cafbd67f0b7d99adadfd5ae011c69b'
        '43452dd4216bba835bff542c02fcd0a80b77fef97a6f1042adcbbbcf312bb856b0707c35b2f1af356e0b4262e501a159f06bf1f947f182d0023cdd4aefbd8a85'
        'c9a8ac98fdeebacd0584bd89cb449b43400296c11c1c8a7dea2ebdd469000451e11d8daf42b9bbbe322eb016bd7e5d338b94f0e72594e6fccd0aaf329a14edc6')

# eof
