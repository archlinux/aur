# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=wpka
pkgver=0.1.0
pkgrel=1
pkgdesc='wayland polkit-agent that lets you use any input'
url='https://github.com/abenz1267/wpka'
arch=('x86_64')
license=('MIT')
makedepends=('go')
conflicts=('wpka')
provides=('wpka')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('090952ce4e029650e256c53c39997aae481d357d34d2716a8534161305715c4a')
b2sums=('3b6e8f23461c5f39a61e9e6549fc6641fdc6cb5f96bfd7160473bbd29a76552ef4694d313165fed16989b59abb9a6e74ed8fc5f362e2d017590b078d7c943d5c')

build() {
  cd ${pkgname}-${pkgver}/cmd

  go build -x -o wpka
}

package() {
  cd ${pkgname}-${pkgver}/cmd
  install -Dm 755 wpka -t "${pkgdir}/usr/bin"
  install -Dm 644 dev.benz.wpka.PolicyKit1.AuthenticationAgent.conf -t "${pkdir}/usr/share/dbus-1/system.d/"

  cd ../
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
