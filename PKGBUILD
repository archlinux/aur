# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Fredrick Brennan <copypaste@kittens.ph>

_pyver=cp313
_mlver="manylinux_2_28_$CARCH"

pkgname=python-skia
_pkgname=skia-python
pkgver=138.0
pkgrel=1
pkgdesc='Python binding to Skia Graphics Library (wheel)'
arch=(x86_64 aarch64)
url="https://github.com/kyamagu/$_pkgname"
license=(BSD-3-Clause)
depends=(fontconfig opengl-driver python)
makedepends=(python-installer)
options=(!strip)
_wheel="${_pkgname/-/_}-$pkgver-$_pyver-$_pyver-$_mlver.whl"
source=("https://files.pythonhosted.org/packages/$_pyver/${_pkgname::1}/$_pkgname/$_wheel")
sha256sums=('a6b3e58756a9fa8af3714edc05aeafc7922090f5a276c4be11337f252921dbe8')

# If anybody wants to muck around with the Chromium tree and figure out how to
# build skia from source on Arch I'm open to patches, but even after mucking
# around with ninja and Python2 and various patched bulid toolchains I have
# come up short of a way to build this against Arch packages. Drop a comment on
# the AUR page if you have ideas.

package() {
	python -m installer --destdir="$pkgdir" $_wheel
	python -O -m compileall "$pkgdir"
}
