# Maintainer: Andreas Baumann <mail@andreasbaumann.cc>

pkgname=rust-bin
pkgver=1.37.0
pkgrel=1

pkgdesc='Binary precompiled packages for Rust'
url='https://www.rust-lang.org/'
arch=(i486 i686 pentium4 x86_64)
license=('MIT' 'Apache')

provides=('rust' 'cargo')
conflicts=('rust' 'cargo')

options=('!emptydirs')

case "${CARCH}" in
  x86_64)               _ARCH='x86_64-unknown-linux-gnu';;
  i486|i686|pentium4)   _ARCH='i686-unknown-linux-gnu';;
esac

source=("https://static.rust-lang.org/dist/rust-$pkgver-$_ARCH.tar.gz"{,.asc})

sha256sums=('74510e0e52a55e65a9f716673c2cda4d2bd427e2453541c6993c77c3ec04acf9'
            'SKIP')

validpgpkeys=('108F66205EAEB0AAA8DD5E1C85AB96E6FA1BE5FE'  # Rust Language (Tag and Release Signing Key) <rust-key@rust-lang.org>
              '474E22316ABF4785A88C6E8EA2C794A986419D8A') # Tom Stellard <tstellar@redhat.com>

package() {
  cd "rust-$pkgver-$_ARCH"

  ./install.sh --prefix=/usr --destdir="$pkgdir"
}
