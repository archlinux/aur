# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Simon Keimer <dc0sk at secure dot mailbox dot org>
pkgname=antscope2-git
pkgver=r65.27225ec-1
pkgrel=1
epoch=
pkgdesc="The AntScope2 software is designed to support various models of RigExpert hamradio antenna analyzers under various operating systems."
arch=('x86_64' 'i686')
url="https://github.com/rigexpert/AntScope2"
license=('MIT')
groups=()
depends=(bzip2 double-conversion e2fsprogs freetype2 gcc-libs glib2 glibc graphite harfbuzz icu keyutils krb5 libgcrypt libglvnd libgpg-error libpng libusb libx11 libxau libxcb libxdmcp lz4 md4c openssl pcre pcre2 qt5-base qt5-serialport systemd-libs xz zlib zstd)
makedepends=('git')
checkdepends=()
source=("${pkgname}::git+git://github.com/rigexpert/AntScope2.git")
noextract=()
md5sums=('SKIP')
sha256sums=('SKIP')

pkgver() {
	cd ${srcdir}/${pkgname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd ${srcdir}/${pkgname}
	qmake
	make
}

package() {
	cd ${srcdir}/${pkgname}"/build/release"
	
	install -Dm755 AntScope2 $pkgdir/usr/bin/AntScope2
	
}
