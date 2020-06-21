# Maintainer: Tony Fettes <feihaoxiang2014@gmail.com>
# Contributor: Elrondo46 (https://github.com/Elrondo46)
# Contributor: kounch (https://github.com/kounch)

pkgname=argonone-git
_gitname=argonone
pkgver=r25.ff51561
pkgrel=1
pkgdesc="Argon One Service and Control Scripts por Raspberry Pi"
arch=('any')
url='https://download.argon40.com/argon1.sh'
license=('GPL3')
makedepends=('git')
depends=('i2c-tools' 'lm_sensors' 'python>=3.3' 'raspberrypi-userland-aarch64-git')
provides=('argonone')
install=argonone.install
source=("git+https://github.com/Elrondo46/argonone")
sha256sums=('SKIP')

pkgver() {
  cd ${_gitname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -Dm755 "${srcdir}"/"${_gitname}"/argonone-config "${pkgdir}"/usr/bin/argonone-config
  install -Dm755 "${srcdir}"/"${_gitname}"/argononed-poweroff.py "${pkgdir}"/usr/lib/systemd/system-shutdown/argononed-poweroff.py
  install -Dm644 "${srcdir}"/"${_gitname}"/argononed.conf "${pkgdir}"/etc/argononed.conf
  install -Dm644 "${srcdir}"/"${_gitname}"/argononed.conf "${pkgdir}"/opt/argonone/etc/argononed.conf
  install -Dm755 "${srcdir}"/"${_gitname}"/argononed.py "${pkgdir}"/opt/argonone/bin/argononed.py
  install -Dm644 "${srcdir}"/"${_gitname}"/argononed.service "${pkgdir}"/usr/lib/systemd/system/argononed.service
}
