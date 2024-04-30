# Maintainer: Antheas Kapenekakis <aur at antheas dot dev>
pkgname=jkbd
pkgver=0.0.1
pkgrel=1
pkgdesc='Joystick to Keyboard service. Converts joysticks into a keyboard device. '
arch=('x86_64')
url='https://github.com/hhd-dev/jkbd'
license=('GPL-3.0-or-later')
depends=('python' 'python-evdev' 'python-rich')
makedepends=('python-'{'build','installer','setuptools','wheel'} 'git')
source=("git+https://github.com/hhd-dev/jkbd.git#tag=v${pkgver}")
sha512sums=('ffc76304b8da25b8e998b096a29aa03d11f924e22251251868db810f68d5d6b93897148da32bb394cfa6929e83172ea1e01fc04e589ded15bfe40fc427c0a735')

prepare() {
  cd "jkbd"
}

build() {
  cd "jkbd"
  python -m build --wheel --no-isolation
}

package() {
  cd "jkbd"
  python -m installer --destdir="$pkgdir" dist/*.whl
  mkdir -p ${pkgdir}/usr/lib/systemd/system/
  install -m644 usr/lib/systemd/system/jkbd.service ${pkgdir}/usr/lib/systemd/system/jkbd.service
}
