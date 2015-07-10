# Contributor: Vojtech Kral <vojtech_kral^hk>


pkgname=deepdream-git
pkgver=r16.f8f03a5
pkgrel=1
pkgdesc="Google DeepDream experiment"
arch=('i686' 'x86_64')
url="https://github.com/google/deepdream"
license=('Apache v2')
depends=(
	'caffe-git'
	'python2-numpy'
	'python2-scipy'
	'python2-pillow'
	'ipython2-notebook'
	'protobuf'
)
source=(
	'git+https://github.com/google/deepdream.git'
	'http://dl.caffe.berkeleyvision.org/bvlc_googlenet.caffemodel'
	'deepdream.sh'
)
install='install'
sha256sums=(
	'SKIP'
	'SKIP'
	'76c3dfd5d2c985c5f5b75a88d241ff0e1c60f5dffd82655e59bc1ec47b22d96d'
)

pkgver() {
	cd "${srcdir}/deepdream"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "${srcdir}"
	install -d -m 755 "${pkgdir}/opt/caffe/models/bvlc_googlenet/"
	install -m 644 'bvlc_googlenet.caffemodel' "${pkgdir}/opt/caffe/models/bvlc_googlenet/"
	cp -r 'deepdream' "${pkgdir}/opt"
	install -d 755 "${pkgdir}/usr/bin"
	install -m 755 'deepdream.sh' "${pkgdir}/usr/bin/deepdream"
}
