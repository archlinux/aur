# Maintainer: Lubosz Sarnecki <lubosz@gmail.com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Nathaniel Chin <thegamingorangutans+aur at gmail.com>
# Original: bitwave > https://aur.archlinux.org/packages/python-scenedetect/

_pkgname="python-scenedetect"
pkgname="${_pkgname}-git"
pkgver=0.6.7.1.release.r56.gd75833f
pkgrel=1
pkgdesc="🎥 Python and OpenCV-based scene cut/transition detection program & library."
license=('BSD-3-Clause')
arch=('any')
url="https://github.com/Breakthrough/PySceneDetect"
depends=('python' 'python-click' 'python-opencv' 'python-numpy' 'python-tqdm' 'python-platformdirs')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=("python-pytest")
optdepends=('mkvtoolnix-cli: Splitting in copy mode.'
            'ffmpeg: Splitting in precise mode.'
            'python-av: Additional video backend.'
            'python-moviepy: Additional video backend.'
            'python-onnxruntime: transnet_v2 detector.')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
	git -C "$_pkgname" describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$_pkgname"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_pkgname"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}/
}
