# Maintainer: Klaus Alexander Seistrup <klaus@seistrup.dk>
# -*- sh -*-

pkgname='python-nestedtext'
_pkgname=${pkgname##python-}
pkgver=3.1
pkgrel=3
pkgdesc='Human readable and writable data interchange format'
arch=('any')
license=('MIT')
url='https://github.com/KenKundert/nestedtext'
source=(
  "$_pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
)
depends=('python>=3.6')
makedepends=(
  'python-inform'
  'python-setuptools'
  'python-sphinx'
)
md5sums=(
  'ac4203d20e0bc44d99cdb231cfdd617c'
)
sha1sums=(
  'a013c3739ec27c67c66cf8879dd09177b978d0b5'
)
sha256sums=(
  'c9557c4980d908e52a6c5b4e6b78d0d914d1109d1633ae2aeb9003da6a3108f5'
)
sha512sums=(
  'de8f5add591c93a6bf9edf598af9de00458d1dbec64e4ef2cef2be07dae0c194025fd3035030a436ad43c241ec7e2194c953d19b406dc4c9a78e096171079e04'
)
b2sums=(
  '4d29b0cb52f260f495b7e263242247f13aeea934c15b0ca3ce06e38827f862ceb8405c209b65ae29f78530279c000c1ad3b911309145f2dfebf66cee11b20fa2'
)

build() {
  cd "$srcdir/$_pkgname-$pkgver" || exit 1

  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver" || exit 1

  python setup.py install --root="$pkgdir" --prefix=/usr --optimize=1 --skip-build

  install -Dm0644 LICENSE    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0644 README.rst "$pkgdir/usr/share/doc/$pkgname/README.rst"

  cd "$srcdir/$_pkgname-$pkgver/doc" || exit 1

  for fname in Makefile *.*; do
    install -Dm0644 "$fname" "$pkgdir/usr/share/doc/$pkgname/$fname"
  done
}

# eof
