# Maintainer: aksr <aksr at t-com dot me>
pkgname=firefox-youtube-no-buffer-git
pkgver=r6.128d9ed
pkgrel=1
epoch=
pkgdesc="A bulletproof Firefox only extension to prevent YouTube player from buffering."
arch=('any')
url="https://github.com/james-fray/YouTube-No-Buffer"
license=('MPL')
categories=()
groups=()
depends=('')
makedepends=('git' 'unzip')
optdepends=()
checkdepends=()
provides=()
conflicts=('firefox-youtube-no-buffer')
replaces=()
backup=()
options=()
changelog=
install=
source=("$pkgname::git+https://github.com/james-fray/YouTube-No-Buffer")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$pkgname/src"
  unzip -qqo iynbuffer.xpi -d iynbuffer
}


package() {
  cd "$srcdir/$pkgname/src"
  _extension_id="$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' iynbuffer/install.rdf)"
  _extension_dest="$pkgdir/usr/lib/firefox/browser/extensions/${_extension_id}"
  install -Dm644 iynbuffer.xpi "${_extension_dest}.xpi"
}

