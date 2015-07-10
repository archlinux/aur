# Maintainer: Patrick Wozniak <email@patwoz.de>

pkgname=masterpassword-cli-git
pkgver=2.3.r3.gff12aa6
pkgrel=1
pkgdesc="CLI version of Master Password. (git-version)"

arch=('any')
url="https://github.com/Lyndir/MasterPassword"
license=('GPL3')

optdepends=(
  'xclip: copy password to clipboard'
)
makedepends=(
  'openssl'
  'gcc'
  'git'
  'subversion'
)
conflicts=(
  'masterpassword-cli'
)

source=("${pkgname%-git}::git+http://github.com/Lyndir/MasterPassword.git#branch=master")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  pwd
  cd "${pkgname%-git}/MasterPassword/C" # change dir to cli version of masterpassword
  targets="mpw" ./build
}

package() {
  cd "${pkgname%-git}"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE"

  cd "MasterPassword/C" # change dir to cli version of masterpassword
  # run ./install
  # mkdir -p "$bindir"
  # echo -e "$bindir\nn" | ./install
  # rm "$bindir/bashlib"

  install -Dm755 "mpw" "$pkgdir/usr/bin/mpw"
}
