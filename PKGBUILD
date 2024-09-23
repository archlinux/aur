# Contributor: aksr <aksr at t-com dot me>
# Maintainer: bcc <ben at copeland dot me dot uk>

pkgname=smatch
pkgver=1.73.572.g0c399914
pkgrel=1
pkgdesc="Static analysis tool for C programs that performs semantic analysis to detect bugs and vulnerabilities."
arch=('x86_64' 'i686')
url="https://github.com/error27/smatch"
license=('GPL2')
depends=('gcc' 'make' 'sqlite3' 'openssl' 'perl')
makedepends=('git' 'perl-dbd-sqlite' 'perl-try-tiny')
source=("$pkgname::git+https://github.com/error27/smatch.git")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"

  # Compile the smatch tool
  make
}

package() {
  cd "$srcdir/$pkgname"

  # Install the compiled smatch tool into the appropriate directories
  install -Dm755 smatch "$pkgdir/usr/bin/smatch"

  # Install the database utilities (optional if part of smatch)
  install -Dm755 smatch_scripts/*.pl "$pkgdir/usr/bin/"

  # License
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# Optional: function to fetch the latest version from the Git repository
pkgver() {
  cd "$srcdir/$pkgname"
  git describe --tags | sed 's/^v//;s/-/./g'
}

provides=('smatch')
conflicts=('smatch-git')  # If needed to prevent conflicts with another smatch package

