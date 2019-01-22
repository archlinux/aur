# Maintainer: aksr <aksr at t-com dot me>
pkgname=rsound-git
pkgver=0.6.r699.g5148cde
pkgrel=2
epoch=
pkgdesc="A multi-platform, simple PCM audio server and client."
arch=('i686' 'x86_64')
url="https://github.com/Themaister/RSound"
license=('GPLv3')
groups=()
depends=()
makedepends=('git')
optdepends=('alsa-lib' 'oss' 'libao' 'portaudio' 'openal' 'pulseaudio' 'jack')
checkdepends=()
provides=(${pkgname%-*})
conflicts=(${pkgname%-*})
replaces=()
backup=()
options=()
changelog=
install=
source=("$pkgname::git+https://github.com/Themaister/RSound.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g;s/^v//'
}

build() {
  cd "$srcdir/$pkgname"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install
  install -Dm644 DOCUMENTATION $pkgdir/usr/share/doc/${pkgname%-*}/DOCUMENTATION
  install -Dm644 COPYING $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
}

