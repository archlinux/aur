# Maintainer: Dominic Meiser <aur@msrd0.de>

pkgbase=cpptoml
pkgname=(cpptoml cpptoml-doc)
pkgver=0.1.0
pkgrel=1
pkgdesc="A header-only library for parsing TOML configuration files."
arch=('any')
url="https://github.com/skystrife/cpptoml"
license=('MIT')
makedepends=('cmake' 'doxygen' 'git' 'graphviz')
source=("https://github.com/skystrife/cpptoml/archive/v$pkgver.tar.gz")
sha256sums=('11b1c07132d23e85071cef3d0fe9bc605de731fcd1b1c3f3d43ed09a6fd7a850')

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
