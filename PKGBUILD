# Maintainer: Arne Beer <arne@twobeer.de>

_gitname=xpmclient
pkgname=zcash-${_gitname}-git
pkgver='r123.f19b9b9'
pkgrel=1
arch=('any')
pkgdesc='A GPU miner for zcash.'
license=('')
depends=('zeromq' 'amdapp-sdk' 'czmq' 'gmp' 'protobuf')
makedepends=('git')
provides=('zcash-xmpclient')
url='https://github.com/eXtremal-ik7/xpmclient'
source=("https://github.com/eXtremal-ik7/xpmclient")
sha256sums=('SKIP')

package() {
  cd "${_gitname}"
  git checkout version/zcash

  mkdir build
  cd build
  cmake ../../xpmclient -DOPENCL_LIBRARY=/usr/lib/libOpenCL.so -DOPENCL_INCLUDE_DIRECTORY=/opt/AMDAPP/SDK/include

  # Place binary
  install -Dm755 "./xpmclient" "${pkgdir}/usr/bin/xpmclient-zcash"
}
