# NiceHash equihash miner. CPU xenocat solver build
# Maintainer: Sebastian Stammler <echo c2ViQGhkZG4uc3BhY2UK|base64 -d>
_pkgname=nheqminer-cpu
pkgname=${_pkgname}-git
pkgver=0.4b.r1.ge2a73b4
pkgrel=1
pkgdesc="zcash equihash miner by NiceHash. Xenoncat CPU solver build."
arch=('x86_64')
url="https://github.com/nicehash/nheqminer/"
license=('MIT')
depends=('boost')
makedepends=('git')
optdepends=('zcash: zcash node and tools')
source=("${pkgname}::git+https://github.com/nicehash/nheqminer.git")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

_build_dir="Linux_cmake/nheqminer_cpu"
build() {
  cd "${pkgname}/cpu_xenoncat/Linux/asm/"
  sh assemble.sh
  cd "../../../${_build_dir}"
  cmake .
  make -j $(nproc)
}

package() {
	cd "${pkgname}"
  install -D -m755 "${_build_dir}/nheqminer_cpu" -t "${pkgdir}/usr/bin/"
  install -D -m644 LICENSE_MIT -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
