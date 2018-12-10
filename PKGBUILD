# Maintainer: TheSilentDrifter a.k.a Larry Dewey <larry.j.dewey@gmail.com>

pkgname=tutanota-electron-git
pkgver=0.0.3
pkgrel=1
pkgdesc="A secure email client"
arch=('x86_64')
url="https://gitlab.com/TheSilentDrifter/Tutanota-Electron"
licence=('BSD')
depends=('gconf' 'gulp-cli' 'npm')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=()
changeLog=()
source=("https://gitlab.com/TheSilentDrifter/Tutanota-Electron/raw/master/tutanota-electron-git.tar.gz")
md5sums=('b31cbabdee3abefc90cc77879c203a09')
sha512sums=('d11862b21e32dd4d7b5800c4bb4148e332e07aa369080259c5fe619de6b3f5cd7bfe3943f75a742518d9abfa6d31d0c15c52f889c9ed805d63cf612bd9f8e653')
build() {
  cd "$pkgname"
  npm install -g electron-packager
  ./build.sh
}

package() {
  mkdir -p "${pkgdir}/opt/$pkgname/"
  mkdir -p "${pkgdir}/usr/bin"
  cp -r "${srcdir}/${pkgname}/releases/tutanota-linux-x64/" "${pkgdir}/opt/$pkgname"
  install -Dm644 "$srcdir/$pkgname/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
  ln -s /opt/tutanota-electron-git/tutanota-linux-x64/tutanota "${pkgdir}/usr/bin/tutanota"
  install -Dm755 "$srcdir/$pkgname/tutanota.desktop" "${pkgdir}/usr/share/applications/tutanota.desktop"
}
