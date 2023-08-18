# Maintainer: Karol 'Kenji Takahashi' Woźniak <kenji.sx>
_basename=untrunc
pkgname=untrunc-anthwlock-cli-git
pkgver=r308.d72ec32
pkgrel=2
pkgdesc="Restore a truncated mp4/mov. Improved version of ponchio/untrunc. CLI only."
arch=('x86_64')
url="https://github.com/anthwlock/untrunc"
license=('GPL')
groups=()
depends=('ffmpeg4.4')
makedepends=('git')
provides=("$_basename-git")
conflicts=("$_basename-git")
replaces=("$_basename-git")
backup=()
options=()
install=
source=('untrunc::git+https://github.com/anthwlock/untrunc')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${_basename}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${_basename}"
	CPATH=/usr/include/ffmpeg4.4/ LDFLAGS='-L /usr/lib/ffmpeg4.4' make
}

package() {
	cd "$srcdir/${_basename}"
	install -Dm755 untrunc "$pkgdir/usr/bin/untrunc"
}
