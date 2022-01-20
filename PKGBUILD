# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Fredrick Brennan <copypaste@kittens.ph>

pkgname=python-skia
_pkgname=skia-python
pkgver=87.4
pkgrel=1
pkgdesc='Python binding to Skia Graphics Library (wheel)'
arch=(x86_64)
url="https://github.com/kyamagu/$_pkgname"
license=(BSD)
depends=(fontconfig opengl-driver python)
makedepends=(python-pip)
options=(!strip)
_py=cp310
_wheel="${_pkgname/-/_}-$pkgver-$_py-$_py-manylinux_2_17_x86_64.manylinux2014_x86_64.whl"
source=("https://files.pythonhosted.org/packages/$_py/${_pkgname::1}/$_pkgname/$_wheel")
sha256sums=('db29525c36c8ef17b80cba1881a4149d9605e7768a90da799d43861c0ae16cc7')

# If anybody wants to muck around with the Chromium tree and figure out how to
# build skia from source on Arch I'm open to patches, but even after mucking
# around with ninja and Python2 and various patched bulid toolchains I have
# come up short of a way to build this against Arch packages. Drop a comment on
# the AUR page if you have ideas.

package() {
	export PIP_CONFIG_FILE=/dev/null
	pip install --isolated --root="$pkgdir" --ignore-installed --no-deps $_wheel
	python -O -m compileall "$pkgdir"
}
