# Maintainer: Doclic <doclic@tutanota.com>
# Contributor: HurricanePootis <hurricanepootis@protonmail.com>

pkgname=vtex2-bin
pkgver=0.3.1
pkgrel=1
pkgdesc="A VTF conversion and creation tool"
arch=(x86_64)
url="https://github.com/StrataSource/vtex2"
license=('MIT')
depends=('libglvnd' 'glibc' 'gcc-libs' 'qt6-base')
makedepends=('patchelf')
provides=(vtex2)
conflicts=(vtex2)
source=("https://github.com/StrataSource/vtex2/releases/download/v${pkgver}/vtex2.linux-amd64.zip"
        "$url/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=('5524585b80db1c18e988620427c377d3'
         '4f65c0611719f2e56c223c9a27a3da2b')

package() {
	install -Dm755 "$srcdir/vtex2" "$pkgdir/usr/bin/vtex2"
	install -Dm755 "$srcdir/vtfview" "$pkgdir/usr/bin/vtfview"
	install -Dm644 "$srcdir/${pkgname::-4}-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/vtex2-bin/LICENSE"
	for file in {vtex2,vtfview}; do
		patchelf --remove-rpath "$pkgdir/usr/bin/${file}"
	done
}
