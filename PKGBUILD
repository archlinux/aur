# Maintainer: Will Foran <willforan+aur@gmail.com>
pkgname=strfry-git
pkgver=r103.e5ec135
pkgrel=1
pkgdesc="a nostr relay w/filesystem LMDB and merkle-tree reconcilliation"
arch=(x86_64)
url="https://github.com/hoytech/strfry"
license=('GPL')
groups=()
depends=()
makedepends=('git' 'flatbuffers'  'libsecp256k1-git' 'perl-template-toolkit')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('strfry::git+https://github.com/hoytech/strfry')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare(){
	cd "$srcdir/${pkgname%-git}"
   git submodule update --init
}
build() {
	cd "$srcdir/${pkgname%-git}"
	make setup-golpe
	make
}

package() {
   install -D -m 0755 "$srcdir/${pkgname%-git}/strfry" "$pkgdir/usr/bin/strfry"
   install -D  "$srcdir/${pkgname%-git}/strfry.conf" "$pkgdir/etc/strfy.conf.example"
}
