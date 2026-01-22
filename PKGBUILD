# Please report maintenance problems to the project GitHub issue tracker
#   i.e. https://github.com/Student-Team-Projects/email-client/issues

pkgname=email-client
pkgver=2.0.0
pkgrel=1
pkgdesc="A CLI email client for Arch Linux"
arch=('x86_64')
url="https://github.com/Student-Team-Projects/email-client"
license=('GPL3')

# Runtime Dependencies
depends=(
  'gcc-libs'
  'openssl'
  'icu'
  'gnutls'
  'ncurses'
  'libffi'
  'sqlite'
  'libxml2'

  # AUR – skips having to install it by hand just for us
  'vmime'
)

# Build Dependencies
makedepends=(
  'base-devel'
  'cmake'
  'make'
  'gcc'
  'git'
  'pkgconf'
)

# Sources and Checksums
source=("https://github.com/Student-Team-Projects/Email-Client/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('fb7a83c4f3f7146cd249aada58e11d33797e3c8638313d7de87c7c206454745f')

prepare() {
  cd "$srcdir" || exit 1
  tar xzvf "${pkgver}.tar.gz"
}

build() {
  cd "$srcdir" || exit 1
  mkdir -p build
  cd build || exit 1

  cmake -DCMAKE_BUILD_TYPE=Release \
    -DEXTERNAL_SQLITE=ON \
    -DEXTERNAL_LIBXML2=ON \
    -DEXTERNAL_VMIME=ON ..
  make
}

package() {
  cd "$srcdir/build" || exit 1

  # Install the email client binary
  install -Dm755 "email_client" "$pkgdir/usr/bin/email_client"
}
