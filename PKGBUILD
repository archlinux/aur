# Maintainer: João Daniel <jotaf.daniel@gmail.com>
pkgname=gcommit-git
pkgver=v0.1.2.r9.g812052b
pkgrel=1
epoch=
pkgdesc="A git-plugin that eases pair-programming commits"
arch=(x86_64)
url="https://github.com/jooaodanieel/GCommit"
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
  cd GCommit
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd GCommit
  ./gradlew build
}

package() {
	cd GCommit
  mkdir -p ${pkgdir}/opt/${pkgname}
  cp -rf * ${pkgdir}/opt/${pkgname}
  mkdir -p ${pkgdir}/usr/local/bin
  cp build/bin/native/releaseExecutable/g-commit.kexe ${pkgdir}/usr/local/bin/git-gcommit
  chmod 755 ${pkgdir}/usr/local/bin/git-gcommit
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
