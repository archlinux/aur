# Maintainer: João Daniel <jotaf.daniel@gmail.com>
pkgname=dk-assist-git
pkgver=v0.1.5.r6.gdb7a81f
pkgrel=1
epoch=
pkgdesc="A tool that helps devs to set up a repository with configs, such as .env files"
arch=(x86_64)
url="https://github.com/jooaodanieel/dk-assist"
license=('MIT')
groups=()
depends=()
makedepends=(git libxcrypt)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(git+"$url")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
  cd dk-assist
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd dk-assist
  ./gradlew build
}

package() {
	cd dk-assist
  mkdir -p ${pkgdir}/opt/${pkgname}
  cp -rf * ${pkgdir}/opt/${pkgname}
  mkdir -p ${pkgdir}/usr/local/bin
  cp build/bin/native/releaseExecutable/dk-assist.kexe ${pkgdir}/usr/local/bin/dk-assist
  chmod 755 ${pkgdir}/usr/local/bin/dk-assist
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
