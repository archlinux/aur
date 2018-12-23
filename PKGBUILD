# Maintainer: Dominic Meiser <aur@msrd0.de>

pkgbase=cpptoml
pkgname=(cpptoml cpptoml-doc)
pkgver=0.1.1
pkgrel=1
pkgdesc="A header-only library for parsing TOML configuration files."
arch=('any')
url="https://github.com/skystrife/cpptoml"
license=('MIT')
makedepends=('cmake' 'doxygen' 'git' 'graphviz' 'texlive-core')
source=("https://github.com/skystrife/cpptoml/archive/v$pkgver.tar.gz")
sha256sums=('23af72468cfd4040984d46a0dd2a609538579c78ddc429d6b8fd7a10a6e24403')

prepare()
{
  mkdir -p "$srcdir/build"
}

build()
{
  cd "$srcdir/build"

  cmake "$srcdir/cpptoml-$pkgver" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  
  make
  make doc
}

package_cpptoml()
{
  cd "$srcdir/build"

  make DESTDIR="$pkgdir" install

  install -Dm644 "$srcdir/cpptoml-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_cpptoml-doc()
{
  cd "$srcdir/build/doc/html/"
  find . -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/doc/cpptoml/{}" ';'
  install -Dm644 "$srcdir/cpptoml-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
