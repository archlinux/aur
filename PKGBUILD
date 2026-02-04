# Maintainer: trappedwastaken <realtrapped@gmail.com>
pkgname=llama.cpp-bin-noavx
pkgver=7825
pkgrel=2
pkgdesc="Llama.cpp (no AVX, SSE4.2 only) for i3-540 and NVIDIA Pascal (GT 1030) support"
arch=('x86_64')
url="https://github.com/trappedwastaken/old_cpus_linux_binaries"
license=('MIT')
provides=('llama-cpp')
conflicts=('llama-cpp' 'llama-cpp-git' 'llama-cpp-bin')
options=(!debug)

source=("https://github.com/trappedwastaken/old_cpus_linux_binaries/releases/download/v7825/llama-noavx.tar.gz")
sha256sums=('4923a758a4b6420f395334919a54612d87f73cf3a50c49735454477ed7a36314')

package() {
  cd "$srcdir"
  install -Dm755 llama-cli "${pkgdir}/usr/bin/llama-cli"
  install -Dm755 llama-server "${pkgdir}/usr/bin/llama-server"
  mkdir -p "${pkgdir}/usr/lib/llama-cpp"
  cp -P libs/*.so* "${pkgdir}/usr/lib/llama-cpp/"
  mkdir -p "${pkgdir}/etc/ld.so.conf.d"
  echo "/usr/lib/llama-cpp" > "${pkgdir}/etc/ld.so.conf.d/llama-cpp.conf"
}
