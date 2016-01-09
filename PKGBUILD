# Maintainer: aksr <aksr at t-com dot me>
pkgname=sedsed-git
pkgver=1.0.r85.gd9d8e93
pkgrel=1
epoch=
pkgdesc="Debugger, indenter and HTMLizer for sed scripts."
arch=('i686' 'x86_64')
url="https://github.com/aureliojargas/sedsed"
url="http://aurelio.net/projects/sedsed/"
license=('MIT')
groups=()
depends=('python')
makedepends=('git')
optdepends=()
checkdepends=()
provides=('sedsed')
conflicts=('sedsed')
replaces=()
backup=()
options=()
changelog=CHANGELOG.md
install=
source=("$pkgname::git+https://github.com/aureliojargas/sedsed.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --tags | sed -E ';s/^v//g;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$pkgname"
  ## change to use python2
  #sed -i '1s/python/python2/' sedsed.py
}

package() {
  cd "$srcdir/$pkgname"
  mkdir -p $pkgdir/usr/{bin,share/{doc/$pkgname,licenses/$pkgname}}
  install -Dm755 sedsed.py $pkgdir/usr/bin/sedsed
  install -Dm644 README.md $pkgdir/usr/share/doc/$pkgname/README.md
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

