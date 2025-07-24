# Maintainer: Laukhi <laukhi [at] airmail [dot] cc>
pkgname=quickpiperaudiobook-git
pkgver=v0.0.4.r77.g92dfd5e
pkgrel=1
pkgdesc="Create a natural audiobook for any text content with one command."
arch=('x86_64')
url="https://github.com/C-Loftus/QuickPiperAudiobook"
license=('AGPL-3.0-only')
groups=()
depends=('calibre')
makedepends=('git' 'go')
optdepends=('ffmpeg: mp3 support')
provides=("quickpiperaudiobook")
conflicts=("quickpiperaudiobook")
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/C-Loftus/QuickPiperAudiobook.git')
noextract=()
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/QuickPiperAudiobook"
  git describe --tags --long --abbrev=7 | sed 's/^foo-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$srcdir/QuickPiperAudiobook"
}

build() {
	cd "$srcdir/QuickPiperAudiobook"
  go mod tidy
  go build \
     -trimpath \
     -buildmode=pie \
     -mod=readonly \
     -modcacherw \
     -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
     .
}

check() {
  cd "$srcdir/QuickPiperAudiobook"
  make test
}

package() {
	install -Dm755 "$srcdir/QuickPiperAudiobook/QuickPiperAudiobook" "$pkgdir/usr/bin/QuickPiperAudiobook"
}
