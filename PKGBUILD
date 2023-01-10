# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <nikita6@bk.ru>
pkgname=hactoolnet-git
_gitname="LibHac"
pkgver=0.17.0.gfe2549cb
pkgrel=1
pkgdesc="An example program that uses LibHac. It is used in a similar manner to hactool."
arch=('any')
url="https://github.com/Thealexbarney/${_gitname}"
license=('MIT')
depends=(dotnet-runtime)
makedepends=(dotnet-sdk git)
source=("git+https://github.com/Thealexbarney/LibHac.git")
sha256sums=(SKIP)

prepare() {
	cd "${_gitname}"
}

build() {
	cd "${_gitname}"
    dotnet build --configuration release --output "artifacts"
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}

package() { 
  mkdir -p "${pkgdir}/usr/share/"
  cp -r "${srcdir}/${_gitname}/artifacts/" "${pkgdir}/usr/share/${pkgname}"
  mkdir -p "${pkgdir}/usr/bin/"
  ln -s "/usr/share/${pkgname}/hactoolnet" "${pkgdir}/usr/bin/hactoolnet"

  # Licenses
  install -Dm644 "${srcdir}/${_gitname}/LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
