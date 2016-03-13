# Maintainer: Benjamin Chrétien <chretien at lirmm dot fr>
_name=tensorflow
pkgname=python2-tensorflow-cuda
pkgver=0.7.1
pkgrel=1
pkgdesc="Open source software library for numerical computation using data flow graphs"
url="http://tensorflow.org"
# TODO: add missing dependencies
depends=('python2' 'python2-numpy' 'python2-protobuf3' 'cuda' 'cudnn')
makedepends=('python2' 'python2-pip')
license=('Apache')
replace=('python2-tensorflow')
provides=('python2-tensorflow')
arch=('x86_64')
_filename="tensorflow-${pkgver}-cp27-none-linux_${CARCH}.whl"
source=("https://storage.googleapis.com/tensorflow/linux/gpu/${_filename}")
noextract=("${_filename}")
if test "$CARCH" == x86_64 ; then
  sha256sums=('cf7133acfce09f0f3614d45a8b699d3ec6c346ac56b831d5f552be33bb6260ea')
fi

# TODO: add CUDA support

package() {
  cd "${srcdir}"
  _site_packages=$(python2 -c "import site; print(site.getsitepackages()[0])")
  pip2 install --ignore-installed --no-deps \
    --root=${pkgdir} \
    --install-option="--prefix=${pkgdir}/usr" \
    --install-option="--install-scripts=${pkgdir}/usr/bin" \
    --install-option="--install-lib=${pkgdir}/${_site_packages}" \
    --install-option="--install-data=${pkgdir}/var/lib/${_name}" \
    --install-option="--root=${pkgdir}" \
    ${srcdir}/${_filename}
}
