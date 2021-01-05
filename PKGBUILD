# Maintainer: Eli Stone <eli.stonium@gmail.com>

pkgname=python-parallelencode
_name="${pkgname#python-}"
pkgver=0.1.12
pkgrel=1
pkgdesc='A python framework to split and encode videos in parallel'
url='https://github.com/parallelencode/PyParallelEncode'
arch=('any')
license=('GPL3')
source=(
	"https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
)
makedepends=('python-setuptools')
depends=(
	'python' 'python-scipy' 'python-psutil'
	'ffmpeg' 'python-numpy' 'opencv'
)
optdepends=('vmaf: Target vmaf support',
'python-scenedetect: Splitting based on scenedetect instead of (the faster and better) ffmpeg',
'vapoursynth-plugin-lsmashsource: Do not create split files, use vapoursynth to split instead',
'libvpx: vp8/vp9 output support',
'aom: av1 output support',
'x264: h264/AVC output support',
'x265: h265/HEVC output support',
)

sha256sums=('af2db851f9ccb36452e1b1cfddf4dc68926fec3bcc3f355a2efdbdc1500ee964')

build() {
	cd "$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
