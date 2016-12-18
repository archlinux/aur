# Maintainer: Patrick Wozniak <email@patwoz.de>

pkgname=masterpassword-cli
pkgver=2.2
pkgrel=5
pkgdesc="CLI version of Master Password."

arch=('any')
url="http://masterpasswordapp.com/"
license=('GPL3')

optdepends=(
  'xclip: copy password to clipboard'
)
makedepends=(
  'openssl'
  'gcc'
  'git'
)
conflicts=(
  'masterpassword-cli-git'
)

source=("https://ssl.masterpasswordapp.com/$pkgname.tar.gz")
sha256sums=('6ea76592eb8214329072d04f651af99d73de188a59ef76975d190569c7fa2b90')

prepare() {
  sed -i '/^svn=/d' ./lib/scrypt/.source
}

build() {
	targets="mpw mpw-bench mpw-tests" ./build
  ./mpw-bench
  ./mpw-tests
}

package() {
  /usr/bin/install -Dm755 "mpw" "$pkgdir/usr/bin/mpw"
}
