# Maintainer: TheSilentDrifter a.k.a Larry Dewey <larry.j.dewey@gmail.com>

pkgname=tutanota-electron-git
pkgver=0.0.1
pkgrel=1
pkgdesc="A secure email client"
arch=('x86_64')
url="https://bitbucket.org/Thesilentdrifter/tutanota-electron"
licence=('BSD')
depends=('gulp-cli' 'npm')
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
source=("https://bitbucket.org/Thesilentdrifter/tutanota-electron/raw/82fd82caa6515e2c55ed6400a3f6fb32918a2b72/tutanota-electron-git.tar.gz")
md5sums=(f2a936d72db2f2156836d122fceee67c)
sha512sums=(17678c208d419fda214bfa584a8dd4ab30724b6b3b80f545818de85da432b14431e10b9e537029be6dda900466cc7e33a9b9ab40892de3902f11c42b5f68bf51)

build() {
  cd "$pkgname"
  sudo npm install electron-packager -g
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
