# Maintainer : Mikalai Ramanovich <nikolay dot romanovich at narod dot ru>

pkgname=mi-air-wmi-dkms-git
_pkgname='mi-air-wmi'
pkgver=1.0.0
pkgrel=2
pkgdesc="Kernel module enables additional hotkeys on Xiaomi Mi Air laptops"
arch=('i686' 'x86_64')
url="https://github.com/MikalaiR/mi-air-wmi-driver"
license=('GPL2')
depends=('dkms' 'linux-headers')
makedepends=('git')
source=("$_pkgname::git+https://github.com/MikalaiR/mi-air-wmi-driver.git" "dkms.conf")
sha256sums=("SKIP" "b22e7bd50a2d72ce4c0f6164c2dafa88862077327cdfba57d108a4de124e2cea")

pkgver() {
  cd "${srcdir}/${_pkgname}"
  echo $pkgver.$(git rev-parse --short HEAD)
}

prepare() {
  sed -e "s/@PKG@/${_pkgname}/" \
	-e "s/@PKGVER@/${pkgver}/" \
	-i "dkms.conf"
}

package() {
  cd "${srcdir}/${_pkgname}"

  install -dm755 "${pkgdir}/usr/src/${_pkgname}-${pkgver}"
  install -Dm644 Makefile *.c ${srcdir}/dkms.conf "${pkgdir}/usr/src/${_pkgname}-${pkgver}"

  install -dm755 "${pkgdir}/usr/share/doc/${_pkgname}/"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/"
}
