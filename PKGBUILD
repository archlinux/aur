# Contributor: Scott Alfter <scott@alfter.us>

_pkgname=kicad-skip
pkgname="python-$_pkgname"
pkgver=0.2.5
pkgrel=3
pkgdesc="S-expression KiCad file Python parser"
arch=(any)
url=https://github.com/psychogenic/${_pkgname}
license=("LGPL-2.1")
depends=("python" "python-sexpdata")
makedepends=("python-build" "python-installer")
source=(
	"https://github.com/psychogenic/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tar.gz"
	)
sha512sums=(
	"93086c568e4c0bb8b639bcdede0f29f6912d0c725ad6a25d890221ebb2c3945400b302c6b639d6af4ea840779b832771c9129bfedc3772212ed94244740059d3"
	)

# patch disabled as it breaks KiCad 7 while not working properly with KiCad 8+
#	"${_pkgname}-v8-pcb.patch::https://github.com/psychogenic/kicad-skip/commit/aedee140b92cb98f7e9f9272bab07bc66439a71b.patch"
#	"6569266a28908a236c9cd3c072e17c324d709baf5855b3afc8b4368dd210e8b168226f70c3e74b4883691dcf6ecc2bf696a49c22221409d5b715c858671ff39b"

build() 
{
	cd "${_pkgname}-${pkgver}"
#	patch -p1 <../${_pkgname}-v8-pcb.patch
	python -m build --wheel --no-isolation
}

package() 
{
	cd "${_pkgname}-${pkgver}"
	python -m installer --destdir="${pkgdir}" dist/*.whl
}
