# Maintainer: Jeremy MountainJohnson <jay@jskier.com>
# Contributor: Butui Hu <hot123tea123@gmail.com>

_name=streamlit-webrtc
pkgname=python-$_name
pkgver=0.77.0
pkgrel=1
pkgdesc='Real-time video and audio streams over the network, with Streamlit'
arch=(any)
url='https://github.com/whitphx/streamlit-webrtc'
license=(MIT)
depends=(
  python
  python-aioice
  python-aiortc
  python-av
  python-packaging
  python-streamlit
)
makedepends=(
  python-build
  python-hatch-vcs
  python-hatchling
  python-installer
  python-wheel
)
optdepends=('python-twilio: Twilio STUN/TURN server support')
source=(https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz)
sha256sums=('2cb90e8c4ab9c4190c21e7e7cd3ac510f9fc541b2fca4c783e134fc85ccc5ccd')

build() {
  cd ${_name//-/_}-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd ${_name//-/_}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

# vim:set ts=2 sw=2 et:
